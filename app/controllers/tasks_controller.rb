class TasksController < ApplicationController
  before_action -> { set_goal(params[:goal_id]) }, only: [:new, :create]
  before_action :set_task, only: [:edit, :update, :destroy, :complete, :incomplete]

  def index
    redirect_if_not_user(params[:user_id])
    @incomplete_goals = current_user.incomplete_goals_with_tasks
  end

  def new
    redirect_if_goal_completed(@goal)
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

  def edit
    redirect_if_goal_completed(@task.goal)
  end

  def update
    if @task.update(task_params)
      redirect_to goal_url(@task.goal)
    else
      render :edit
    end
  end

  def destroy
    @goal = @task.goal
    @task.destroy
    redirect_to goal_url(@goal)
  end

  def complete
    @task.completed = true
    @task.save
    redirect_to goal_url(@task.goal)
  end

  def incomplete
    if @task.goal.completed
      @task.goal.completed = false
      @task.goal.save
    end
    @task.completed = false
    @task.save
    redirect_to goal_url(@task.goal)
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

  def set_task
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      flash.alert = "Sorry, that task could not be found"
      return redirect_to user_url(current_user)
    end
  end

  def redirect_if_goal_completed(goal)
    if goal.completed
      flash.alert = "You must reopen a goal to modify it and its tasks"
      return redirect_to goal_url(goal)
    end
  end
end
