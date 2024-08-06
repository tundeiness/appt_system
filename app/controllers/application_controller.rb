class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  load_and_authorize_resource unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
