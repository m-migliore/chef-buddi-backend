class MealplanMealSerializer < ActiveModel::Serializer
  attributes :id, :meal
  belongs_to :meal, serializer: MealSerializer
end
