class Review < ApplicationRecord
  belongs_to :movie
  validates :body, presence: true
  validates :author, presence: true
  validates :score, presence: true
end
