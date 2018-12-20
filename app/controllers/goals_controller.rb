class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit]

  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.build(goal_params)

    if @goal.save
      redirect_to goal_url(@goal)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :summary)
  end

  def set_goal
    @goal = current_user.goals.find_by(id: params[:id])
    unless @goal
      flash.alert = "Sorry, that goal could not be found"
      redirect_to user_url(current_user)
    end
  end
end
