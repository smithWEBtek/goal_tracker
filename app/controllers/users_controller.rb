class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_and_redirect(@user)
    else
      render :new
    end
  end

  def show
    @incomplete_goals = current_user.incomplete_goals
    @completed_goals = current_user.completed_goals
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
