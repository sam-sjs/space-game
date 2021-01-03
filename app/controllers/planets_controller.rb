class PlanetsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
    planet = Planet.find params[:id]
    response = {}

    case params[:type]
    when 'mine' then response = {
      mineMsg: planet.build_mine,
      fuelStatus: planet.fuel_status,
      updateFuel: planet.system.user.fuel,
      updateCurrency: planet.system.user.currency}
    when 'investigate' then response = {
      investigateMsg: planet.investigate_poi,
      sensorStatus: planet.sensor_status,
      updateFuel: planet.system.user.fuel,
      updateCurrency: planet.system.user.currency,
      updateCrystals: {
        green: planet.system.user.green_crystals,
        red: planet.system.user.red_crystals,
        blue: planet.system.user.blue_crystals,
        purple: planet.system.user.purple_crystals}}
    when 'collect' then response = {
      collectMsg: planet.collect_fuel,
      fuelStatus: planet.fuel_status,
      updateFuel: planet.system.user.fuel}
    end

    render json: response
  end

  def old_update
    planet = Planet.find params[:id]
    case params[:type]
    when 'mine' then flash[:notice] = planet.build_mine
    when 'investigate' then flash[:notice] = planet.investigate_poi
    when 'collect' then flash[:notice] = planet.collect_fuel
    end
    redirect_to system_path(planet.system.id)
  end

  def destroy
  end
end
