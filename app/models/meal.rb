class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :user_recipe
  has_many :mealplan_meals
end
