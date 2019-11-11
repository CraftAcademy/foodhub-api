# frozen_string_literal: true

class V1::RecipesController < ApplicationController
  def create
    recipe = Recipe.create(recipe_params)
    if recipe.persisted?
      render json: { message: 'The recipe was successfully created.' }
    else
      render json: { error_message: 'Unable to create recipe' }, status: 400
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :directions)
  end
end
