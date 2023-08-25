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


    if @spaceship.user.email == "malte@human.com"
      file = URI.open("https://res.cloudinary.com/ddynviqg1/image/upload/v1692957422/Spaceships/enterprise_odg8ih.jpg")
      @spaceship.photo.attach(io: file, filename: "#{@spaceship.name}.jpg", content_type: "image/jpg")
    elsif @spaceship.user.email == "chewie@wookie.com"
      file = URI.open("https://res.cloudinary.com/ddynviqg1/image/upload/v1692957409/Spaceships/falcon_yroek8.jpg")
      @spaceship.photo.attach(io: file, filename: "#{@spaceship.name}.jpg", content_type: "image/jpg")
    else
      file = URI.open("https://res.cloudinary.com/ddynviqg1/image/upload/v1692700093/Spaceships/thomas-woodward-03_yzxne7.jpg")
      @spaceship.photo.attach(io: file, filename: "#{@spaceship.name}.jpg", content_type: "image/jpg")
    end


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
