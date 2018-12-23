class OmniAuthController < ApplicationController
  skip_before_action :require_login, only: [:facebook]

  def facebook
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_facebook(auth)
    session[:user_id] = user.id
    redirect_to user_url(user)
  end
end
