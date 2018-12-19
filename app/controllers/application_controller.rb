class ApplicationController < ActionController::Base

  private

  def login_and_redirect(user)
    session[:user_id] = user.id
    redirect_to user_url(user)
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    @user = User.find_by(id: session[:user_id]) if logged_in?
  end
end
