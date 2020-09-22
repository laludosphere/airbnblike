class Review < ApplicationRecord
  belongs_to :flat
  validates :content, presence: true
  validates :content, length: {minimum:5}
end