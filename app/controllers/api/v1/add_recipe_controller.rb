class Api::V1::AddRecipeController < ApplicationController

  def add
    non_nil_params = recipe_params.to_h.compact
    cleaned_params = {}

    non_nil_params.each do |key,value|
      if (value.is_a? String) && (!value.empty?)
        cleaned_params[key] = value
      end
    end

    @recipe = Recipe.create(cleaned_params)
    if @recipe.save
      @user_recipe = UserRecipe.create(user_id: recipe_params[:userId], recipe_id: @recipe.id)
      if @user_recipe.save
        byebug
        render json: @user_recipe, status: :accepted
      else
        render json: { errors: @user_recipe.errors.full_messages }, status: :unprocessible_entity
      end
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessible_entity
    end

  end

  private

  def recipe_params
    params.permit(:name, :category, :area, :instructions, :image, :youtube, :tags, :source, :custom, :userId)
  end
end
