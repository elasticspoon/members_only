class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name username email password password_confirmation current_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
