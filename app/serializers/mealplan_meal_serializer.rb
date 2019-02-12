class MealplanMealSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id
  # belongs_to: :recipe
end
