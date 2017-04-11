class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :online_users

  after_action :update_user_last_action

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :birthdate])
  end

  def online_users
    @online_users = User.where('last_action >= ?', Time.now - 5.minutes)
  end

  def update_user_last_action
    current_user.update_last_action if user_signed_in?
  end
end
