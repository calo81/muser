class AuthenticatedController < ActionController::Base
  before_filter :authenticate_google_user!
  def authenticate_google_user!
    redirect_to '/auth/google_oauth2' if !current_user
  end
end