class Api::V1::AddRecipeController < ApplicationController

  def add
    non_nil_params = recipe_params.to_h.compact
    cleaned_params = {}

    non_nil_params.each do |key,value|
      if (value.is_a? String) && (!value.empty?)
        cleaned_params[key] = value
      else
        cleaned_params[key] = value
      end
    end

    @recipe = Recipe.create(cleaned_params)
    if @recipe.save
      create_recipe_ingredients(params[:ingredients], @recipe)

      @user_recipe = UserRecipe.create(user_id: user_recipe_params[:userId], recipe_id: @recipe.id)
      if @user_recipe.save
        byebug
        render json: @user_recipe, status: :accepted
      else
        render json: { errors: @user_recipe.errors.full_messages }, status: :unprocessible_entity
      end
    else
      render json: { errors: @recipe.errors }, status: :unprocessible_entity
    end

  end

  # def create_recipe_ingredients
  #   ingreds = params[:ingredients]
  #
  #   ingreds.map do |i|
  #     if !!Ingredient.find_by(name: i.downcase)
  #       ingred_id = Ingredient.find_by(name: i.downcase).id
  #       RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: ingred_id)
  #     else
  #       @ingredient = Ingredient.create(name: i.downcase)
  #       RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: @ingredient.id)
  #     end
  #   end
  #
  # end
  #
  # def test
  #   ingreds = user_recipe_params[:ingredients]
  #   ingreds.each do |i|
  #     if !!Ingredient.find_by(name: i[:name].downcase)
  #       "yay"
  #       ingred_id = Ingredient.find_by(name: i[:name].downcase).id
  #       RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: ingred_id, measurement: i[:measurement])
  #     else
  #       "boo"
  #       @ingredient = Ingredient.create(name: i[:name].downcase)
  #       RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: @ingredient.id, measurement: i[:measurement])
  #     end
  #   end
  #
  # end


  # def create_recipe_ingredients(ingred_list, recipe)
  #
  #
  #   ingred_list.map do |i|
  #     if !!Ingredient.find_by(name: i.downcase)
  #       ingred_id = Ingredient.find_by(name: i.downcase).id
  #       RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingred_id)
  #     else
  #       @ingredient = Ingredient.create(name: i.downcase)
  #       RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: @ingredient.id)
  #     end
  #   end
  #
  # end

  def create_recipe_ingredients(ingred_list, recipe)
    debugger
    ingred_list.each do |i|
      if !!Ingredient.find_by(name: i[:name].downcase)
        "yay"
        ingred_id = Ingredient.find_by(name: i[:name].downcase).id
        RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingred_id, measurement: i[:measurement])
      else
        "boo"
        @ingredient = Ingredient.create(name: i[:name].downcase)
        RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: @ingredient.id, measurement: i[:measurement])
      end
    end

  end

  private

  def recipe_params
    params.permit(:name, :category, :area, :instructions, :image, :youtube, :tags, :source)
  end

  def user_recipe_params
    params.permit(:name, :category, :area, :instructions, :image, :youtube, :tags, :source, :custom, :userId, :ingredients)
  end
end
