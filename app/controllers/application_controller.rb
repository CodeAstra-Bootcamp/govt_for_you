class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :fetch_badge_counts

protected
  def fetch_badge_counts
    return unless user_signed_in?

    @appeals_count = current_user.appeals.count
    @public_appeals_count = Appeal.count
  end
end
