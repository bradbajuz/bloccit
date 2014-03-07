class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_filter :add_allowed_devise_session_params, if: :devise_controller?

  protected

  def add_allowed_devise_session_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :avatar, :email, :password, :password_confirmation, :current_password) }
  end
end
