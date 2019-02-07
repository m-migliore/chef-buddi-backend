class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.integer :user_recipe_id

      t.timestamps
    end
  end
end
