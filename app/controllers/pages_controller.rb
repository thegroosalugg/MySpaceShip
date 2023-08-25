class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @spaceships = Spaceship.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query OR ILIKE :model"
      @spaceships = @spaceships.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def dashboard
    # we want to display all of our ships
    @spaceships = Spaceship.where(user_id: current_user.id)

    # we want to display all our bookings (outgoing) PLUS their status
    @my_bookings = Booking.where(user_id: current_user.id)
    # raise

    # we want to display all the booking requests that a user reveived from other users (incoming) + their status
    @my_spaceships_bookings = Booking.joins(:spaceship).where(spaceships: { user_id: current_user.id })
  end

  
  def confirm
    @booking = Booking.find(params[:booking_id])
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:booking_id])
    @booking.status = "rejected"
    @booking.save
    # @booking.destroy # instead of destoying please hide in the view
    redirect_to dashboard_path
  end
end
