class Mealplan < ApplicationRecord
  belongs_to :user
  has_many :mealplan_meals
end
