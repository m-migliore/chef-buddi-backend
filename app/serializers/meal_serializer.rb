class MealSerializer < ActiveModel::Serializer
  attributes :id, :mealplan_id
  belongs_to :mealplan, serializer: MealplanMealSerializer
  # belongs_to :recipe, serializer: SingleRecipeSerializer
end
