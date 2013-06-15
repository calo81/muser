class EntriesController < ApplicationController
  def update
    Entry.find(params[:id]).update_attributes(params)
    render :json => {message: 'OK'}, :status => 204
  end
end
