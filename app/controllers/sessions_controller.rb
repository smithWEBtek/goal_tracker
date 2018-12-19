class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      login_and_redirect(@user)
    else
      render :new #figure out error messages
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
