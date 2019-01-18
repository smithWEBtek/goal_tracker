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
      respond_to do |f|
        f.html { redirect_to goal_url(@goal) }
        f.json { render json: @task }
      end
    else
      respond_to do |f|
        f.html { render :new }
        f.json { render json: @task }
      end
    end
  end

  def edit
    redirect_if_goal_completed(@task.goal)
    redirect_if_task_completed(@task)
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
      redirect_to user_url(current_user)
    end
  end

  def redirect_if_task_completed(task)
    if task.completed
      flash.alert = "You must reopen a task to modify it"
      redirect_to goal_url(task.goal)
    end
  end
end
