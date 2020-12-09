class SystemsController < ApplicationController
  def new
  end

  def create
    next_sys = System.check_system(params[:prev_loc], params[:sys_id])
    @current_user.fuel -= 1
    @current_user.save
    if next_sys
      arrival = System.find(next_sys)
      arrival.send(params[:prev_loc]+"=", params[:sys_id])
      arrival.save
      redirect_to system_path(next_sys) and return
    else
      valid_directions = ["sys_below_id", "sys_above_id", "sys_left_id", "sys_right_id"]
      redirect_to root_path and return unless valid_directions.include? params[:prev_loc]

      system = System.create user_id: @current_user.id
      Planet.planet_setup(system.id, system.name)
      #Send the previous location (i.e. above, below, left, right) as a 'setter' and make equal to previous systems id
      system.send(params[:prev_loc]+"=", params[:sys_id])
      system.save
      redirect_to system_path(system.id)
    end
  end

  def index
  end

  def show
    @current_system = System.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
