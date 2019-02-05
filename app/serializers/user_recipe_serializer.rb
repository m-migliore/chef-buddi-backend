class UserRecipeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :recipe_id, :name, :image

  def name
    Recipe.find(object.recipe_id).name
  end

  def image
    Recipe.find(object.recipe_id).image
  end
end
