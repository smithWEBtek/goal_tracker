class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  before_action :require_login

  private

  def login_and_redirect(user)
    session[:user_id] = user.id
    redirect_to user_url(user)
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    unless logged_in?
      flash.alert = "You must be logged in"
      redirect_to root_url
    end
  end
end
