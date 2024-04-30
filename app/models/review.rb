class Review < ApplicationRecord
  belongs_to :movie
  validates :author, presence: true
  validates :score, presence: true
end
