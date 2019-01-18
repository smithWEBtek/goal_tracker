class TaskSerializer < ActiveModel::Serializer
  attributes :id, :incomplete_html

  def incomplete_html
    TasksController.render(partial: "incomplete_task", locals: { task: object }, layout: false).squish if object.persisted?
  end
end
