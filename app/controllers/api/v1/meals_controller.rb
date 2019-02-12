class Api::V1::MealsController < ApplicationController
  before_action :find_meal, only: [:show, :destroy]

  def index
    @meals = Meal.all
    render json: @meals
  end

  def show
    render json: @meal
  end

  def create
    @meal = Meal.create(meal_params)
    if @meal.save
      render json: @meal, status: :accepted
    else
      render json: { errors: @meal.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def update
  #   @meal.update(meal_params)
  #   if @meal.save
  #     render json: @meal, status: :accepted
  #   else
  #     render json: { errors: @meal.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

  def destroy
    @meal.destroy
    @mealplan = Mealplan.find(@meal.mealplan_id)
    render json: @mealplan
  end

  private

  def meal_params
    params.permit(:mealplan_id, :recipe_id)
  end

  def find_meal
    @meal = Meal.find(params[:id])
  end
end
