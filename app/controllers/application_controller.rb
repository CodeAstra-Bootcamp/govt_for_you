class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :fetch_badge_counts
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def fetch_badge_counts
    return unless user_signed_in?

    @appeals_count = current_user.appeals.count
    @public_appeals_count = Appeal.count
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:pan, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :pan, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:pan, :email, :password, :password_confirmation, :current_password) }
  end
end
