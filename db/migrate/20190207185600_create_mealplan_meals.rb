class CreateMealplanMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :mealplan_meals do |t|
      t.integer :mealplan_id
      t.integer :meal_id

      t.timestamps
    end
  end
end
