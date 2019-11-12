# frozen_string_literal: true

class V1::RecipesController < ApplicationController

  def index
    recipes = Recipe.all
    render json: recipes, each_serializer: Recipes::IndexSerializer
  end

  def create
    recipe = Recipe.create(recipe_params)
    if recipe.persisted?
      render json: { message: 'The recipe was successfully created.' }, status: 201
    else
      render json: { error_message: 'Unable to create recipe' }, status: 422
    end
  end

  def show
    if Recipe.exists?(id:params[:id])
      recipe = Recipe.find(params[:id])
      render json: recipe, serializer: Recipes::IndexSerializer
    else
      render json: { error_message: 'The recipe could not be found'}, status: 404
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :directions)
  end
end
