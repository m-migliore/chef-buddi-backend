class Meal < ApplicationRecord
  belongs_to :recipe
  has_many :recipe_ingredients, through: :recipe
  has_many :ingredients, through: :recipe_ingredients
end
