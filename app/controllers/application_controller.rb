class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :state_id])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
    end
  end
end
