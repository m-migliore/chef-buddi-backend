class MealplanSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :created_at
  has_many :recipes, through: :meals
end
