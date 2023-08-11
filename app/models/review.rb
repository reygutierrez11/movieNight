class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true
  validates :score, presence: true
end
