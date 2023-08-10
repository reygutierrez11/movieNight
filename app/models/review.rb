class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 100}
  validates :author, presence: true
  validates :score, presence: true
end
