class ApplicationController < ActionController::Base

  private

  def login_and_redirect(user)
    session[:user_id] = user.id
    redirect_to user_url(user)
  end
end
