class SystemsController < ApplicationController
  def new
  end

  def create
    system = System.create user_id: @current_user.id
    orbitals = 4  #Change to rand(1..4)
    orbitals.times do |i|
      Planet.create name: system.name + "-" + ('a'..'d').to_a[i], system_id: system.id
    end
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

  # private
  #
  # def system_params
  #   params.require(:system).permit(:name, :image, :user_id)
  # end
end
