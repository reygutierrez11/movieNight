class Suggestion < ApplicationRecord
  acts_as_votable
  validates :movie, presence: true
  validates :author, presence: true
end
