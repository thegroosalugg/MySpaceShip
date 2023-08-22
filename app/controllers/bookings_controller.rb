class BookingsController < ApplicationController
  def new
    @bookings = Bookings.new
  end
  
  def index

    @bookings = Bookings.all
  end

  def create

    @bookings = Bokings.new(bookings_params)
    if @Bookings.save
      redirect_to bookings_path(@bookings)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bookings
    @bookings = Bookings.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:name, :photo)
  end

end
