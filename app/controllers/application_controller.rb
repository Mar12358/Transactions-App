class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { home_page? || Rails.env.test? }

  private

  def home_page?
    controller_name == 'home' && action_name == 'index'
  end
end
