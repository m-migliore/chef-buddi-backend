class DropMealplan < ActiveRecord::Migration[5.2]
  def change
    drop_table :mealplans
  end
end
