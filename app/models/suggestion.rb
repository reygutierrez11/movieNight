class Suggestion < ApplicationRecord
  acts_as_votable
  validates :movie, presence: true
  validates :author, presence: true
  belongs_to :sugg_box

  def self.move_old_weekly_suggestions
    # seconds_in_a_week = 604_800 
    seconds_in_a_week = 10
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
end
