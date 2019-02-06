class Api::V1::AddRecipeController < ApplicationController
  def add
    non_nil_params = recipe_params.to_h.compact
    cleaned_params = {}

    non_nil_params.each do |key,value|
      if (value.is_a? String) && (!value.empty?)
        cleaned_params[key] = value
      end
    end

    byebug
    puts "sup"
  end

  private

  def recipe_params
    params.permit(:name, :category, :area, :instructions, :image, :youtube, :tags, :source, :custom, :userId)
  end
end
