class Suggestion < ApplicationRecord
  validates :movie, presence: true
  validates :author, presence: true
end
