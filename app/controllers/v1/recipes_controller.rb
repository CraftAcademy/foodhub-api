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
      attach_image(recipe)
      render json: { message: 'The recipe was successfully created.' }, status: 201
    else
      render json: { error_message: 'Unable to create recipe.' }, status: 422
    end
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe, serializer: Recipes::ShowSerializer
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update(recipe_params)
      render json: { message: 'Your recipe has been updated.' }, status: 200
    else
      render_error_message(recipe.errors.full_messages.to_sentence, 422)
    end
  end

  private

  def attach_image(recipe)
    params_image = params['recipe']['image']
    if params_image && params_image.present?
      DecodeService.attach_image(params_image, recipe.image)
    end
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :directions, :image)
  end

  def record_not_found
    render json: { error_message: 'The recipe could not be found.'}, status: 404
  end

  def render_error_message(message, status) 
    render json: { error_message: message }, status: status
  end
end