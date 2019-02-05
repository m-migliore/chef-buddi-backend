class Api::V1::UserRecipesController < ApplicationController
  before_action :find_user_recipe, only: [:show, :destroy]

  def index
    @user_recipes = UserRecipe.all
    render json: @user_recipes
  end

  def show
    render json: @user_recipe
  end

  def create
    @user_recipe = UserRecipe.create(user_recipe_params)
    if @user_recipe.save
      render json: @user_recipe, status: :accepted
    else
      render json: { errors: @user_recipe.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def update
  #   @user_recipe.update(user_recipe_params)
  #   if @user_recipe.save
  #     render json: @user_recipe, status: :accepted
  #   else
  #     render json: { errors: @user_recipe.errors.full_messages }, status: :unprocessible_entity
  #   end
  # end

  def destroy
    @user_recipe.destroy
  end

  private

  def user_recipe_params
    params.permit(:user_id, :recipe_id)
  end

  def find_user_recipe
    @user_recipe = UserRecipe.find(params[:id])
  end
end
