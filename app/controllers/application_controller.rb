class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_google_user!
    redirect_to '/auth/google_oauth2' if !current_user
  end

end
