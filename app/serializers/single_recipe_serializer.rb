class SingleRecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :area, :instructions, :image, :youtube, :tags, :source
  has_many :recipe_ingredients

end
