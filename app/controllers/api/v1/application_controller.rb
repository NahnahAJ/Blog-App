  class Api::V1::ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    respond_to :json
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:name, :email, :password, :password_confirmation)
      end
      devise_parameter_sanitizer.permit(:sign_in) do |u|
        u.permit(:email, :password)
      end
    end
  end