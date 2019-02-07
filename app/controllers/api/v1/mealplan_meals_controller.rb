class Api::V1::MealplanMealsController < ApplicationController
  before_action :find_mealplan_meal, only: [:destroy]

  def index
    @mealplan_meals = MealplanMeal.all
    render json: @mealplan_meals
  end

  def create
    @mealplan_meal = MealplanMeal.create(mealplan_meal_params)
    if @mealplan_meal.save
      render json: @mealplan_meal, status: :accepted
    else
      render json: { errors: @mealplan_meal.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def show
  #   render json: @mealplan_meal
  # end
  #
  # def update
  #   @mealplan_meal.update(mealplan_meal_params)
  #   if @mealplan_meal.save
  #     render json: @mealplan_meal, status: :accepted
  #   else
  #     render json: { errors: @mealplan_meal.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

  def destroy
    @mealplan_meal.destroy
  end

  private

  def mealplan_meal_params
    params.permit(:mealplan_id, :meal_id)
  end

  def find_mealplan_meal
    @mealplan_meal = MealplanMeal.find(params[:id])
  end
end
