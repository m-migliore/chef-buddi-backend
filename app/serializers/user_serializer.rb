class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :recipes, through: :user_recipes
  # has_many :ingredients, through: :user_ingredients
  has_many :user_ingredients, key: :ingredients
end
