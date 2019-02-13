class MealplanSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :created_at, :mealCount, :recipes, :shoppingList
  # has_many :recipes, through: :meals

  def mealCount
    object.meals.length
  end

  def recipes
   mp_recipes = object.meals.map do |meal|
     {
       id: meal.recipe.id,
       meal_id: meal.id,
       name: meal.recipe.name,
       image: meal.recipe.image,
     }
   end
  end

  def shoppingList
    all_ingredients = []
    # object.meals.ingredients.each do |ingredient|
    #   all_ingredients << ingredient
    # end

    object.meals.each do |meal|
      meal.ingredients.each do |ingredient|
        all_ingredients << ingredient
      end
    end

    cleaned_total_ingredients = all_ingredients.uniq

    user = User.find(object.user_id)
    user_ingredients = user.ingredients

    shopping_list = cleaned_total_ingredients.select do |ingredient|
      !user_ingredients.include?(ingredient)
    end

    shopping_list
  end
end
