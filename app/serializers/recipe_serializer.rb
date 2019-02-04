class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :area, :instructions, :image, :youtube, :tags, :source
  has_many :ingredients, through: :recipe_ingredients
end
