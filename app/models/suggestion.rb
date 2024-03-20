class Suggestion < ApplicationRecord
  acts_as_votable
  validates :movie, presence: true
  validates :author, presence: true
  belongs_to :sugg_box
  
  # def initialize
  #   self.add_quick_description
  # end

  def self.move_old_weekly_suggestions
    seconds_in_a_week = 345_600 
    t = Time.now
    suggestions = SuggBox.find_by_name("Weekly").suggestions.all
    suggestions.each do |s|
      if t - s.updated_at > seconds_in_a_week
        s.move_suggestions_to_new_box(SuggBox.find_by_name("All Encompassing").id)
      end
    end
  end

  def move_suggestions_to_new_box(destination_box_id)
    self.update(sugg_box_id: destination_box_id)
    self.get_likes.delete_all
  end

  def add_quick_description
    agent = Mechanize.new
    agent.log = Logger.new 'mech.log'
    agent.user_agent_alias = 'Linux Firefox'
    page = agent.get('https://www.imdb.com/')

    # nav and search
    imdb_search_form = page.form('nav-search-form')
    imdb_search_form.q = "#{self.movie}"

    # collect links and get uri of first result
    page = agent.submit(imdb_search_form, imdb_search_form.buttons.first)
    options = agent.page.links

    first_option = options.find do |link|
      link.resolved_uri.to_s.include?('tt_1')
    end.resolved_uri

    # get description off page
    description = agent.get(first_option).search(".//span[@class='sc-466bb6c-0 hlbAws']").text
    self.description = description
  end

end
