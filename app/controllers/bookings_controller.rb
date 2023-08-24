class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @spaceship = Spaceship.find(@booking.spaceship_id)
  end

  def new
    @booking = Booking.new
    @spaceship = Spaceship.find(params["spaceship_id"])
  end

  def create
    @booking = Booking.new(bookings_params)
    @spaceship = Spaceship.find(params["spaceship_id"])

    @booking.user_id = current_user.id
    @booking.spaceship_id = @spaceship.id.to_i

    if @booking.save
      redirect_to dashboard_path
    else
      render :'spaceships/show', status: :unprocessable_entity, notice: "Cannot create booking without dates"
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
