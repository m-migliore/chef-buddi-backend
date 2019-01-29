class User < ApplicationRecord
  has_many :ingredients, through: :user_ingredients
  has_many :recipes, through: :user_recipes
end
