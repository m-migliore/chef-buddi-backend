class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :measurement, :ingredient
  belongs_to :ingredient
end
