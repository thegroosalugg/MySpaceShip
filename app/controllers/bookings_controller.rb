class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end
  
  def index
    @booking = Booking.all
  end

  def create
    @booking = Booking.new(bookings_params)
    if @booking.save
      redirect_to bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:name, :photo)
  end
end
