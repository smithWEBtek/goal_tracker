class GoalsController < ApplicationController
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
end
