class Flat < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
