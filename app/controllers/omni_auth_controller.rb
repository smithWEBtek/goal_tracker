class OmniAuthController < ApplicationController
  skip_before_action :require_login, only: [:facebook]

  def facebook
    auth = request.env['omniauth.auth']

    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.password = SecureRandom.hex
    end

    session[:user_id] = user.id
    redirect_to user_url(user)
  end
end
