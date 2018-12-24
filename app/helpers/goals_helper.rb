module GoalsHelper
  def incomplete_link_if_completed(goal)
    link_to("Reopen", incomplete_goal_path(goal), method: :patch) if goal.completed
  end

  def complete_link_if_tasks_completed(goal)
    if !goal.completed && goal.incomplete_tasks.none?
      link_to("Complete", complete_goal_path(goal), method: :patch)
    end
  end

  def goal_status_action_link(goal)
    incomplete_link_if_completed(goal) || complete_link_if_tasks_completed(goal)
  end

  def render_task_links_if_incomplete(goal)
    render(partial: "incomplete_goal_task_links", locals: {goal: goal}) unless goal.completed
  end
end
