class MealplanSerializer < ActiveModel::Serializer
  attributes :id, :mealplan_meals
  has_many :mealplan_meals, serializer: MealplanMealSerializer
  # has_many :recipes, through: :mealplan_meals
end
