require 'date'

class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.flat  =  @flat
    @booking.user = current_user
    if @booking.save
      redirect_to all_my_bookings_path
    else
      render flat(@flat)
    end
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.update(accepted: true)
    redirect_to all_my_flats_path
  end

  def declined
      @booking = Booking.find(params[:id])
      @booking.update(accepted: false)
      redirect_to all_my_flats_path
  end

  def update
    @booking.update(booking_params)
    render  :all_my_flats
  end

  def all_my_bookings
    @all_my_bookings = Booking.where("user_id = ?", current_user.id)
  end

  private

  def booking_params
      params.require(:booking).permit(:start_date, :end_date, :flat_id, :accepted)
  end
end
