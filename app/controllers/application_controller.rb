class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  before_filter :add_allowed_devise_session_params, if: :devise_controller?

  protected

  def add_allowed_devise_session_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :name, :avatar, :provider, :uid) }
  end
end
