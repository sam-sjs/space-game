class SystemsController < ApplicationController
  def new
  end

  def create
    system = System.new system_params
    system.name = system.gen_name
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

  private

  def system_params
    params.requre(:system).permit(:name, :image, :user_id)
  end
end
