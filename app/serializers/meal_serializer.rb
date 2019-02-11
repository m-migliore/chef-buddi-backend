class MealSerializer < ActiveModel::Serializer
  attributes :id, :mealplan_id
  belongs_to :recipe
end
