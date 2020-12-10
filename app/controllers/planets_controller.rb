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
    case params[:type]
    when 'mine' then flash[:notice] = planet.build_mine
    when 'investigate' then flash[:notice] = planet.investigate_poi
    end
    redirect_to system_path(planet.system.id)
  end

  def destroy
  end
end
