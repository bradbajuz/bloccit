class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    topics_path
  end

  before_filter :add_allowed_devise_session_params, if: :devise_controller?

  protected

  def add_allowed_devise_session_params
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :name, :avatar, :provider, :uid) }
  end
  
end
