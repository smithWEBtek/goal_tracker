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

  def set_goal(id)
    @goal = current_user.goals.find_by(id: id)
    unless @goal
      flash.alert = "Sorry, that goal could not be found"
      return redirect_to user_url(current_user)
    end
  end

  def redirect_if_not_user(id)
    unless current_user == User.find_by(id: id)
      flash.alert = "Sorry, you can only view your own pages"
      redirect_to user_url(current_user)
    end
  end
end
