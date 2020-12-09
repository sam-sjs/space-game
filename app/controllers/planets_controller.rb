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
    when 'mine' then planet.build_mine
    end
  end

  def destroy
  end
end
