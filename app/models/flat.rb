class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true } 
    }

    def is_available?(start_date, end_date)
      bookings.each do |b|
        return false if (b.start_date..b.end_date).overlaps?(start_date.to_date..end_date.to_date)
      end
      return true
    end
end
