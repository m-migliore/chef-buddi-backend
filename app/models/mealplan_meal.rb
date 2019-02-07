class MealplanMeal < ApplicationRecord
  belongs_to :meal
  belongs_to :mealplan
end
