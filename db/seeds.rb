# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all
#
# u1 = User.create(name: "Matt")

def get_recipes
  request = RestClient.get("https://api.edamam.com/search?&app_id=bd44f2ae&app_key=0d2d5a4eccbf02f3f21f9e06e5b9bacd&from=0&to=25&q=chicken+paprika")
  response = JSON.parse(request)
  results = response["hits"]
  results.each do |result|
    ingredient_prep = result['recipe']['ingredientLines'].each do |ingredient|
      ingredient + "@@@"
    end
    Recipe.create(name: result['recipe']['label'],
                  calories: result['recipe']['calories'],
                  time: result['recipe']['totalTime'],
                  url: result['recipe']['url'],
                  ingredients: ingredient_prep.join()
    )
  end
end

get_recipes

# fetch("").then(r => r.json()).then(data => data.hits.map(hit => hit.recipe.label))
