class SessionsController < ApplicationController
  def create
    user = find_or_create_user
    sign_in(user)
    redirect_to '/'
  end

  protected

  def find_or_create_user
    user = User.find_by({'uid' => auth_hash['uid']})
    if user
      user.update_attributes(hash_data)
    else
      user = User.new(hash_data)
    end
    user.save!
    user
  end

  def hash_data
    auth_hash['info'].merge(auth_hash['credentials']).merge(auth_hash['extra']['raw_info']).merge({'uid' => auth_hash['uid']}).merge(:password => Devise.friendly_token[0,20])
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end