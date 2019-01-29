class Recipe < ApplicationRecord
  has_many :users, through: :user_recipes
  has_many :ingredients, through: :recipe_ingredient
end
