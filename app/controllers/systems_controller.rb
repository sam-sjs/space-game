class SystemsController < ApplicationController
  before_action :authenticate_user
  def new
  end

  def create
    next_sys = System.check_system(params[:prev_loc], current_user.last_system)
    unless next_sys
      # TODO: make sure there are validity checks where necessary (prev_loc, sys_id, others?)
      # Think about whether I need to validate prev_loc - sys_id should all be server side now
      next_sys = System.create user_id: current_user.id
      Planet.planet_setup(next_sys.id, next_sys.name)
    end
    next_sys.send(params[:prev_loc]+"=", current_user.last_system)
    next_sys.time_entered = Time.now.getutc
    next_sys.save
    current_user.last_system = next_sys.id
    current_user.save

    response = {
      systemName: next_sys.name,
      sysBelow: next_sys.sys_below_id.present? ? System.find(next_sys.sys_below_id).name : '???',
      sysAbove: next_sys.sys_above_id.present? ? System.find(next_sys.sys_above_id).name : '???',
      sysLeft: next_sys.sys_left_id.present? ? System.find(next_sys.sys_left_id).name : '???',
      sysRight: next_sys.sys_right_id.present? ? System.find(next_sys.sys_right_id).name : '???',
      userResources: {
        currency: current_user.currency,
        fuel: current_user.fuel,
        crystals: {
          green: current_user.green_crystals,
          red: current_user.red_crystals,
          blue: current_user.blue_crystals,
          purple: current_user.purple_crystals
        }
      },
      planet0: {
        id: next_sys.planets[0].id,
        name: next_sys.planets[0].name,
        img: next_sys.planets[0].image,
        size: next_sys.planets[0].size,
        fuelStatus: next_sys.planets[0].fuel_status,
        sensorStatus: next_sys.planets[0].sensor_status
      },
      planet1: if(next_sys.planets[1].present?)
        {
          id: next_sys.planets[1].id,
          name: next_sys.planets[1].name,
          img: next_sys.planets[1].image,
          size: next_sys.planets[1].size,
          fuelStatus: next_sys.planets[1].fuel_status,
          sensorStatus: next_sys.planets[1].sensor_status
        }
      else
        nil
      end,
      planet2: if(next_sys.planets[2].present?)
        {
          id: next_sys.planets[2].id,
          name: next_sys.planets[2].name,
          img: next_sys.planets[2].image,
          size: next_sys.planets[2].size,
          fuelStatus: next_sys.planets[2].fuel_status,
          sensorStatus: next_sys.planets[2].sensor_status
        }
      else
        nil
      end,
      planet3: if(next_sys.planets[3].present?)
        {
          id: next_sys.planets[3].id,
          name: next_sys.planets[3].name,
          img: next_sys.planets[3].image,
          size: next_sys.planets[3].size,
          fuelStatus: next_sys.planets[3].fuel_status,
          sensorStatus: next_sys.planets[3].sensor_status
        }
      else
        nil
      end
    }

    render json: response
  end # create

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
      # Validate that user has moved from a surrounding system and hasn't plugged anything in themselves - really think about whether we need this, you haven't included in new create path
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
    current_system = System.find current_user.last_system
    current_system.time_entered = Time.now.getutc

    response = {
      systemName: current_system.name,
      sysBelow: current_system.sys_below_id.present? ? System.find(current_system.sys_below_id).name : '???',
      sysAbove: current_system.sys_above_id.present? ? System.find(current_system.sys_above_id).name : '???',
      sysLeft: current_system.sys_left_id.present? ? System.find(current_system.sys_left_id).name : '???',
      sysRight: current_system.sys_right_id.present? ? System.find(current_system.sys_right_id).name : '???',
      userResources: {
        currency: current_user.currency,
        fuel: current_user.fuel,
        crystals: {
          green: current_user.green_crystals,
          red: current_user.red_crystals,
          blue: current_user.blue_crystals,
          purple: current_user.purple_crystals
        }
      },
      planet0: {
        id: current_system.planets[0].id,
        name: current_system.planets[0].name,
        img: current_system.planets[0].image,
        size: current_system.planets[0].size,
        fuelStatus: current_system.planets[0].fuel_status,
        sensorStatus: current_system.planets[0].sensor_status
      },
      planet1: if(current_system.planets[1].present?)
        {
          id: current_system.planets[1].id,
          name: current_system.planets[1].name,
          img: current_system.planets[1].image,
          size: current_system.planets[1].size,
          fuelStatus: current_system.planets[1].fuel_status,
          sensorStatus: current_system.planets[1].sensor_status
        }
      else
        nil
      end,
      planet2: if(current_system.planets[2].present?)
        {
          id: current_system.planets[2].id,
          name: current_system.planets[2].name,
          img: current_system.planets[2].image,
          size: current_system.planets[2].size,
          fuelStatus: current_system.planets[2].fuel_status,
          sensorStatus: current_system.planets[2].sensor_status
        }
      else
        nil
      end,
      planet3: if(current_system.planets[3].present?)
        {
          id: current_system.planets[3].id,
          name: current_system.planets[3].name,
          img: current_system.planets[3].image,
          size: current_system.planets[3].size,
          fuelStatus: current_system.planets[3].fuel_status,
          sensorStatus: current_system.planets[3].sensor_status
        }
      else
        nil
      end
    }

    render json: response
  end

  def show
    # Does this show method still need to exist for API use?
    current_system = System.find current_user.last_system
    # Set time entered for mining function to use
    current_system.time_entered = Time.current
    current_system.save
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
