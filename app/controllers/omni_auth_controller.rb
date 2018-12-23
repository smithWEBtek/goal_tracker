class OmniAuthController < ApplicationController
  skip_before_action :require_login, only: [:facebook]

  def facebook
    auth = request.env['omniauth.auth']
    user = User.find_or_create_with_facebook(auth)
    login_and_redirect(user)
  end
end
