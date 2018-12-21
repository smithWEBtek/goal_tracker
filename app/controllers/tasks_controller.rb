class TasksController < ApplicationController
  before_action -> { set_goal(params[:goal_id]) }, only: [:new, :create]

  def new
    @task = @goal.tasks.new
  end

  def create
    @task = @goal.tasks.build(task_params)

    if @task.save
      redirect_to goal_url(@goal)
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
