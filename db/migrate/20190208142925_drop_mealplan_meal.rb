class DropMealplanMeal < ActiveRecord::Migration[5.2]
  def change
    drop_table :mealplan_meals
  end
end
