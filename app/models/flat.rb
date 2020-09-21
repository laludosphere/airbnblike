class Flat < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

end
