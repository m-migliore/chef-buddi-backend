class Recipe < ApplicationRecord
  has_many :user_recipes
  has_many :users, through: :user_recipes
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  #belongs_to :meal

  validates :name, :category, :instructions, :image, presence: true

  def self.with_ingredients(selections)
    recipes = Recipe.all

    recipes.select do |recipe|
      recipe.ingredients
      recipe_ingred_ids = recipe.ingredients.map {|ingred| ingred.id}
      selections.all? {|ingred| recipe_ingred_ids.include?(ingred)}
    end

  end
end
