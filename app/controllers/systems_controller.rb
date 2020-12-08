class SystemsController < ApplicationController
  def new
  end

  def create
    valid_directions = ["sys_below_id", "sys_above_id", "sys_left_id", "sys_right_id"]
    redirect_to root_path and return unless valid_directions.include? params[:prev_loc]

    system = System.create user_id: @current_user.id
    #Model
    orbitals = 4  #Change to rand(1..4)
    orbitals.times do |i|
      Planet.create name: system.name + "-" + ('a'..'d').to_a[i], system_id: system.id
    end
    #Send the previous location (i.e. above, below, left, right) as a 'setter' and make equal to previous systems id
    system.send(params[:prev_loc]+"=", params[:sys_id])
    system.save
    redirect_to system_path(system.id)
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
