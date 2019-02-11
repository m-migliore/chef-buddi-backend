class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :user_recipes, key: :recipes
  has_many :user_ingredients, key: :ingredients
  has_many :mealplans
end
