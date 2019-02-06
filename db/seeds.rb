# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RecipeIngredient.destroy_all
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
#


User.create(name: "Matt", password: "1234")
puts "users added"


def get_ingredients
  request = RestClient.get("https://www.themealdb.com/api/json/v1/1/list.php?i=list")
  response = JSON.parse(request)
  results = response["meals"]
  results.map do |result|
    Ingredient.create(name: result["strIngredient"].downcase)
  end
end

get_ingredients
puts "ingredients added"

def add_recipe_ingredient(recipe_meal_id, ingredient_name, measurement, correct_ri_length)
  recipe = Recipe.find_by(idMeal: recipe_meal_id)
  ingredient =  Ingredient.find_by(name: ingredient_name.downcase)
  # puts recipe.id
  # puts ingredient.id
  if !!recipe && !!ingredient && recipe.recipe_ingredients.length < correct_ri_length
    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id, measurement: measurement)
  else
    puts "broken r_i add"
  end

  # measurement_array = measurement.split(" ")
  # if measurement_array.length > 2 || measurement_array.length == 1
  #   puts "amount #{measurement}"
  #   puts "unit: #{nil}"
  # else
  #   puts "amount: #{measurement_array[0]}"
  #   puts "unit: #{measurement_array[1]}"
  # end
end

def get_recipes
  request = RestClient.get("https://www.themealdb.com/api/json/v1/1/random.php")
  response = JSON.parse(request)
  result = response["meals"][0]
  if Recipe.find_by(idMeal: result["idMeal"])
    puts "boo"
  else
    Recipe.create(
      name: result["strMeal"],
      idMeal: result["idMeal"],
      category: result["strCategory"],
      area: result["strArea"],
      instructions: result["strInstructions"],
      image: result["strMealThumb"],
      youtube: result["strYoutube"],
      tags: result["strTags"],
      source: result["strSource"],
    )
  end

  ri_length = 0

  ri_length += 1 if result["strIngredient1"].present?
  ri_length += 1 if result["strIngredient2"].present?
  ri_length += 1 if result["strIngredient3"].present?
  ri_length += 1 if result["strIngredient4"].present?
  ri_length += 1 if result["strIngredient5"].present?
  ri_length += 1 if result["strIngredient6"].present?
  ri_length += 1 if result["strIngredient7"].present?
  ri_length += 1 if result["strIngredient8"].present?
  ri_length += 1 if result["strIngredient9"].present?
  ri_length += 1 if result["strIngredient10"].present?
  ri_length += 1 if result["strIngredient11"].present?
  ri_length += 1 if result["strIngredient12"].present?
  ri_length += 1 if result["strIngredient13"].present?
  ri_length += 1 if result["strIngredient14"].present?
  ri_length += 1 if result["strIngredient15"].present?
  ri_length += 1 if result["strIngredient16"].present?
  ri_length += 1 if result["strIngredient17"].present?
  ri_length += 1 if result["strIngredient18"].present?
  ri_length += 1 if result["strIngredient19"].present?
  ri_length += 1 if result["strIngredient20"].present?

  if Recipe.find_by(idMeal: result["idMeal"])
    puts "yay"
    add_recipe_ingredient(result["idMeal"], result["strIngredient1"], result["strMeasure1"], ri_length) if result["strIngredient1"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient2"], result["strMeasure2"], ri_length) if result["strIngredient2"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient3"], result["strMeasure3"], ri_length) if result["strIngredient3"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient4"], result["strMeasure4"], ri_length) if result["strIngredient4"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient5"], result["strMeasure5"], ri_length) if result["strIngredient5"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient6"], result["strMeasure6"], ri_length) if result["strIngredient6"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient7"], result["strMeasure7"], ri_length) if result["strIngredient7"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient8"], result["strMeasure8"], ri_length) if result["strIngredient8"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient9"], result["strMeasure9"], ri_length) if result["strIngredient9"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient10"], result["strMeasure10"], ri_length) if result["strIngredient10"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient11"], result["strMeasure11"], ri_length) if result["strIngredient11"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient12"], result["strMeasure12"], ri_length) if result["strIngredient12"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient13"], result["strMeasure13"], ri_length) if result["strIngredient13"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient14"], result["strMeasure14"], ri_length) if result["strIngredient14"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient15"], result["strMeasure15"], ri_length) if result["strIngredient15"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient16"], result["strMeasure16"], ri_length) if result["strIngredient16"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient17"], result["strMeasure17"], ri_length) if result["strIngredient17"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient18"], result["strMeasure18"], ri_length) if result["strIngredient18"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient19"], result["strMeasure19"], ri_length) if result["strIngredient19"].present?
    add_recipe_ingredient(result["idMeal"], result["strIngredient20"], result["strMeasure20"], ri_length) if result["strIngredient20"].present?
  else
    puts "boo"
  end

end


until Recipe.all.length == 187
  get_recipes
  puts "#{Recipe.all.length}"
end
