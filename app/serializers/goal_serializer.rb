class GoalSerializer < ActiveModel::Serializer
  attributes :id, :show

  def show
    GoalsController.render(partial: "show", assigns: { goal: object }, layout: false).squish
  end
end
