class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :mealplan_meals
end
