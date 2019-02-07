class Api::V1::MealplansController < ApplicationController
  before_action :find_mealplan, only: [:destroy]

  def index
    @mealplans = Mealplan.all
    render json: @mealplans
  end

  def create
    @mealplan = Mealplan.create(mealplan_params)
    if @mealplan.save
      render json: @mealplan, status: :accepted
    else
      render json: { errors: @mealplan.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def show
  #   render json: @meal
  # end
  #
  # def update
  #   @meal.update(meal_params)
  #   if @meal.save
  #     render json: @meal, status: :accepted
  #   else
  #     render json: { errors: @meal.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

  def destroy
    @mealplan.destroy
  end

  private

  def mealplan_params
    params.permit(:user_id)
  end

  def find_mealplan
    @mealplan = Mealplan.find(params[:id])
  end
end
