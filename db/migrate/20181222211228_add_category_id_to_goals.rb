class AddCategoryIdToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :category_id, :integer
  end
end
