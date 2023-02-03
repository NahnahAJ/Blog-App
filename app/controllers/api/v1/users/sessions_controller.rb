# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  skip_before_action :verify_authentically_token, raise: false
  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    current_user ? log_in_success : log_in_failure
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split.last, ENV.fetch('DEVISE_JWT_SECRET_KEY')).first

      current_user = User.find(jwt_payload['sub'])

      current_user ? log_out_success : log_out_failure
    else
      log_out_failure
    end
  end

  def log_in_success
    render json: {
      status: {
        code: 200,
        message: 'Logged in successfully.',
        data: current_user
      }
    }, status: :ok
  end

  def log_in_failure
    render json: {
      status: {
        code: 401,
        message: "Logged in failure. #{resource.errors.full_messages.to_sentence}",
        data: current_user
      }
    }, status: :unauthorized
  end

  def log_out_success
    render json: {
      status: 200,
      message: 'Logged out successfully.'
    }, status: :ok
  end

  def log_out_failure
    render json: {
      status: 401,
      message: 'Logged out failure.'
    }, status: :unauthorized
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
