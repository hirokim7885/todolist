class ApplicationController < ActionController::Base
    before_action :authenticate_account!, except: [:new]

    # private

    # def authenticate_account!
    #   redirect_to sign_in_path unless current_account
    # end


    before_action :configure_permitted_parameters, if: :devise_controller?

    protected 

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
