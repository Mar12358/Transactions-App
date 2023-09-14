class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { home_page? || Rails.env.test? }
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
  end

  private

  def home_page?
    controller_name == 'home' && action_name == 'index'
  end
end
