class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  # has_many :recipes, through: :user_recipes
  has_many :user_recipes, key: :recipes

  has_many :user_ingredients, key: :ingredients
end
