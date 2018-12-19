class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :summary
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
