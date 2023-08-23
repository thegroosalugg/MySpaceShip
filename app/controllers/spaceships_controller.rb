class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: %i[show edit update]
  skip_before_action :authenticate_user!, only: :show

  def index
    @spaceships = Spaceship.all
  end

  def show
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user

    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @spaceship.update(spaceship_params)
    if @spaceship.save
      redirect_to spaceship_path(@spaceship)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def delete
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(:name, :model, :description)
  end
end
