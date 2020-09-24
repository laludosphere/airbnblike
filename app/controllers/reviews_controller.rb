class ReviewsController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end

  def create
    @booking        = Booking.find(params[:booking_id])
    @review         = Review.new(review_params)
    @review.user    = current_user
    @review.booking = @booking
    if @review.save
      redirect_to flat_path(@booking.flat, anchor: "review-#{@review.id}")
    else
      render "bookings/show"
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to flat_path(@review.flat)
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
