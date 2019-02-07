class UserRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  has_many :meals
end
