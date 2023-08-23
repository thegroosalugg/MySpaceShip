class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @spaceship = Spaceship.find(params["spaceship_id"])
  end

  def create
    @booking = Booking.new(bookings_params)
    @spaceship = Spaceship.find(params["spaceship_id"])

    user = current_user
    spaceship_id = @spaceship.id.to_i

    @booking.user_id = current_user.id
    @booking.spaceship_id = spaceship_id

    if @booking.save
      redirect_to spaceships_bookings_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end

    

  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:name, :start_date, :end_date, :spaceship_id)
  end
end
