class SuggBox < ApplicationRecord
  has_many :suggestions
  validates :name, presence: true
end
