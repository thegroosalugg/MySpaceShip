require 'open-uri'

class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: :show

  def index
    @spaceships = Spaceship.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user

  # Choose a random image from the assets folder
   image_filenames = Dir.glob(Rails.root.join('app', 'assets', 'images', 'spaceships', '*.jpg'))
   random_image_filename = image_filenames.sample

  # Attach the random image to the spaceship
   file = File.open(random_image_filename)
   @spaceship.photo.attach(io: file, filename: "#{@spaceship.name}.jpg", content_type: "image/jpg")

    if @spaceship.save
      redirect_to dashboard_path
    else
      # render needs to render dashboard. Currently causes issues
      redirect_to dashboard_path
    end
  end

  def edit
  end

  def update
    @spaceship.update(spaceship_params)
    if @spaceship.save
      redirect_to dashboard_path
    else
      # render needs to render dashboard. Currently causes issues
      redirect_to dashboard_path
    end
  end

  def delete
    @spaceship = Spaceship.find(params[:id])
    @spaceship.destroy

    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(:name, :model, :description, :daily_rate)
  end
end
