class Api::V1::RecipeIngredientsController < ApplicationController
  before_action :find_recipe_ingredient, only: [:show, :update]

  def index
    @recipe_ingredients = RecipeIngredient.all
    render json: @recipe_ingredients
  end

  def show
    render json: @recipe_ingredient
  end

  def update
    @recipe_ingredient.update(recipe_ingredient_params)
    if @recipe_ingredient.save
      render json: @recipe_ingredient, status: :accepted
    else
      render json: { errors: @recipe_ingredient.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def recipe_ingredient_params
    params.permit(:recipe_id, :ingredient_id)
  end

  def find_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end
end
