class Api::V1::UserIngredientsController < ApplicationController
  before_action :find_user_ingredient, only: [:destroy]

  def index
    @user_ingredients = UserIngredient.all
    render json: @user_ingredients
  end

  def create
    @user_ingredient = UserIngredient.create(user_ingredient_params)
    if @user_ingredient.save
      render json: @user_ingredient, status: :accepted
    else
      render json: { errors: @user_ingredient.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def show
  #   render json: @user_ingredient
  # end
  #
  # def update
  #   @user_ingredient.update(user_ingredient_params)
  #   if @user_ingredient.save
  #     render json: @user_ingredient, status: :accepted
  #   else
  #     render json: { errors: @user_ingredient.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

  def destroy
    @user_ingredient.destroy
  end

  private

  def user_ingredient_params
    params.permit(:user_id, :ingredient_id)
  end

  def find_user_ingredient
    @user_ingredient = UserIngredient.find(params[:id])
  end
end
