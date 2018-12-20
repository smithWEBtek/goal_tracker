class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy, :complete, :incomplete]

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

  def show
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to user_url(current_user)
  end

  def complete
    @goal.completed = true
    @goal.save
    redirect_to goal_url(@goal)
  end

  def incomplete
    @goal.completed = false
    @goal.save
    redirect_to goal_url(@goal)
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
