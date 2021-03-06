class Api::V1::MealplansController < ApplicationController
  before_action :find_mealplan, only: [:show, :destroy]

  def index
    @mealplans = Mealplan.all
    render json: @mealplans
  end

  def show
    render json: @mealplan
  end

  def create
    @mealplan = Mealplan.create(mealplan_params)
    if @mealplan.save
      params[:recipeIds].each do |recipe_id|
        Meal.create(mealplan_id: @mealplan.id, recipe_id: recipe_id)
      end
      render json: @mealplan, status: :accepted
    else
      render json: { errors: @mealplan.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def update
  #   @mealplan.update(mealplan_params)
  #   if @mealplan.save
  #     render json: @mealplan, status: :accepted
  #   else
  #     render json: { errors: @mealplan.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

  def destroy
    meals = @mealplan.meals.map{|meal| meal.id}
    Meal.destroy(meals)
    @mealplan.destroy
    render json: {status: "meal deleted"}
  end

  private

  def mealplan_params
    params.permit(:user_id, :title)
  end

  def find_mealplan
    @mealplan = Mealplan.find(params[:id])
  end
end
