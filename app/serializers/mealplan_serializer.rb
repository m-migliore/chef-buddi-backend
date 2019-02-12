class MealplanSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :created_at, :mealCount, :recipes
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
end
