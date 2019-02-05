class UserIngredientSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :ingredient_id, :name
  # belongs_to :ingredient, serializer: IngredientSerializer

  def name
    Ingredient.find(object.ingredient_id).name
  end
end
