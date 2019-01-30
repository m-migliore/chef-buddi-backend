# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Recipe.destroy_all
# Ingredient.destroy_all
#
# u1 = User.create(name: "Matt")
# puts "users added"
#
# def get_recipes
#   request = RestClient.get("https://api.edamam.com/search?&app_id=bd44f2ae&app_key=0d2d5a4eccbf02f3f21f9e06e5b9bacd&from=0&to=25&q=chicken+paprika")
#   response = JSON.parse(request)
#   results = response["hits"]
#   results.each do |result|
#     Recipe.create(name: result['recipe']['label'],
#                   calories: result['recipe']['calories'],
#                   time: result['recipe']['totalTime'],
#                   url: result['recipe']['url'],
#                   ingredients_bulk: result['recipe']['ingredientLines'].join("@@@")
#     )
#    end
#
#
#
# end
#
# get_recipes
# puts "recipes added"

def get_ingredients
  request = RestClient.get("https://www.themealdb.com/api/json/v1/1/list.php?i=list")
  response = JSON.parse(request)
  results = response["meals"]
  results.map do |result|
    Ingredient.create(name: result["strIngredient"])
  end
end

# get_ingredients
# puts "ingredients added"
