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
    when 'mine' then response = {mineMsg: planet.build_mine, fuelStatus: planet.fuel_status}
    when 'investigate' then response = {investigateMsg: planet.investigate_poi, sensorStatus: planet.sensor_status}
    when 'collect' then response = {collectMsg: planet.collect_fuel, fuelStatus: planet.fuel_status}
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
