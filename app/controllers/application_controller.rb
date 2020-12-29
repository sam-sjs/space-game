class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false

  include Knock::Authenticable

  before_action :fetch_user

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end # if
    session[:user_id] = nil unless @current_user.present?
  end # fetch_user

end
