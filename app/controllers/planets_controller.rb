class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  before_action :set_planet, only: %i[show edit update destroy]

  def index
    @planets = Planet.all
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.new
    console
  end

  def edit; end

  def update
    if @planet.update(planet_params)
      redirect_to planet_path(@planet)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @planet.destroy
    redirect_to planets_path, status: :see_other
  end

  def user
    @planets = Planet.where(user: current_user)
  end

  def calendar

  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params.require(:planet).permit(:name, :description, :price_per_night, :population, :planet_type, :photo)
  end
end
