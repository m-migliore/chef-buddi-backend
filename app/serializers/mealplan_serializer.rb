class MealplanSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :created_at, :mealCount
  has_many :recipes, through: :meals

  def mealCount
    object.meals.length
  end
end