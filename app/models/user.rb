class User < ApplicationRecord
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_many :user_recipes
  has_many :recipes, through: :user_recipes
  has_many :mealplans
  has_many :meals, through: :mealplans

  has_secure_password
end
