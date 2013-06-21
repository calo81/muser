class AuthenticatedController < ApplicationController
  before_filter :authenticate_google_user!
  def authenticate_google_user!
    if request.xhr?
      render :js => 'window.location = "/auth/google_oauth2"'  if !current_user
    else
      redirect_to '/auth/google_oauth2' if !current_user
    end    
  end
end