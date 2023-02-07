class ApplicationController < ActionController::API
  before_action :authenticate_user!


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email password])
  end
end
