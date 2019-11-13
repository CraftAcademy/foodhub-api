# frozen_string_literal: true

class V1::RecipesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

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
    recipe = Recipe.find(params[:id])
    render json: recipe, serializer: Recipes::ShowSerializer
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :directions, :image)
  end

  def record_not_found
    render json: { error_message: 'The recipe could not be found'}, status: 404
  end
end