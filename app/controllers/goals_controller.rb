class GoalsController < ApplicationController
  before_action -> { set_goal(params[:id]) }, only: [:show, :edit, :update, :destroy, :complete, :incomplete]

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
    @incomplete_tasks = @goal.incomplete_tasks
    @completed_tasks = @goal.completed_tasks
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
    params.require(:goal).permit(:name, :summary, :category_name)
  end
end
