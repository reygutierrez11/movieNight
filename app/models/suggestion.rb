class Suggestion < ApplicationRecord
  acts_as_votable
  validates :movie, presence: true
  validates :author, presence: true

  def self.clear_suggestions
    seconds_in_a_week = 604_800 
    t = Time.now
    suggestions = Suggestion.all
    suggestions.each do |s|
      if t - s.created_at > seconds_in_a_week
        s.destroy
      end
    end
  end
end
