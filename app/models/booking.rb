class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user
  has_many :reviews, dependent: :destroy


  def display_review_form(user)
    (self.end_date < Date.today) && (self.reviews.find_by(user: user).nil?)
  end


  def total_nights
    (end_date - start_date).to_i
  end

  def total_price
    total_nights * flat.price
  end
end

