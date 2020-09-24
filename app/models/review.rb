class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :content, presence: true
  validates :stars,  numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end