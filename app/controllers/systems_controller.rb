class SystemsController < ApplicationController
  def new
  end

  def create
    
  end

  def old_create
    if @current_user.fuel < 1
      flash[:notice] = "You are out of fuel"
      redirect_to system_path(System.find params[:sys_id]) and return
    end

    # Fuel cost for system travel
    @current_user.fuel -= 1
    @current_user.save

    # Check if system in this direction has been visited before, if it has return that system, if not create new system
    if !params[:startup]
      next_sys = System.check_system(params[:prev_loc], params[:sys_id])
    else
      next_sys = false
    end

    if next_sys
      arrival = System.find(next_sys)
      # Send the previous location (i.e. above, below, left, right) as a 'setter' and make equal to previous systems id
      arrival.send(params[:prev_loc]+"=", params[:sys_id])
      arrival.save
      redirect_to system_path(next_sys) and return
    else
      # Validate that user has moved from a surrounding system and hasn't plugged anything in themselves
      valid_directions = ["sys_below_id", "sys_above_id", "sys_left_id", "sys_right_id"]
      redirect_to root_path and return unless valid_directions.include? params[:prev_loc] or params[:startup]

      system = System.create user_id: @current_user.id
      Planet.planet_setup(system.id, system.name)
      # See above comment
      if !params[:startup]
        system.send(params[:prev_loc]+"=", params[:sys_id])
        system.save
      end
      redirect_to system_path(system.id)
    end
  end

  def index
  end

  def show
    @current_system = System.find params[:id]
    # Set time entered for mining function to use
    @current_system.time_entered = Time.current
    @current_system.save
    @current_user.last_system = @current_system.id
    @current_user.save
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
