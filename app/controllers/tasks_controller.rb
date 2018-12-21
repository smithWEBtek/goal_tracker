class TasksController < ApplicationController
  before_action -> { set_goal(params[:goal_id]) }, only: [:new, :create]
end
