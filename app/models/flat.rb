class Flat < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
