class ApplicationController < ActionController::Base
    # before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    after_action :store_action

    include Pundit

    # Redirect to landing page for logging in
    def store_action
      return unless request.get? 
        store_location_for(:user, '/pages/landing_page_login')
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :phonenumber, :dob])
    end

end