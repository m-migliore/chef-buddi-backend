class MealSerializer < ActiveModel::Serializer
  attributes :id, :recipe
  belongs_to :recipe, serializer: RecipeSerializer
end
