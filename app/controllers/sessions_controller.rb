class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      login_and_redirect(@user)
    else
      flash.now.alert = "Incorrect username or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
