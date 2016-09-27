class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up do |user_params|
      user_params.permit :name, :email, :password,
        :password_confirmation, :avatar
    end
    devise_parameter_sanitizer.permit :account_update do |user_params|
      user_params.permit :name, :email, :password,
        :password_confirmation, :current_password, :avatar
    end
  end

end
