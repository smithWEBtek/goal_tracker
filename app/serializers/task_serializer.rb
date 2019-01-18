class TaskSerializer < ActiveModel::Serializer
  attributes :id, :incomplete_html, :errors

  def incomplete_html
    TasksController.render(partial: "incomplete_task", locals: { task: object }, layout: false).squish if object.persisted?
  end

  def errors
    TasksController.render(partial: "error_messages", locals: { object: object }, layout: false).squish
  end
end
