class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    @recently_created_goals = @category.goals.most_recently_created(10)
  end
end
