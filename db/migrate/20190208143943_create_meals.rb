class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.integer :recipe_id
      t.integer :mealplan_id

      t.timestamps
    end
  end
end
