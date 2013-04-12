class HomeController < ApplicationController
  before_filter :authenticate_google_user!
  def index
  end
end
