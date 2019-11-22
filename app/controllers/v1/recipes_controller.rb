# frozen_string_literal: true

class V1::RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    if params[:user_recipe] == 'true'
      if user_signed_in?
        recipes = current_user.recipes
      else
        render json: {
          errors: ['You need to sign in or sign up before continuing.'] },
          status: 401
        return
      end
    else
      recipes = Recipe.all
    end
    render json: recipes, each_serializer: Recipes::IndexSerializer
  end

  def create
    recipe = current_user.recipes.create(recipe_params)
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
    authorize recipe
    if recipe.update(recipe_params)
      attach_image(recipe)
      render json: { message: 'Your recipe has been updated.' }, status: 201
    else
      render json: { error_message: recipe.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :directions, :description)
  end

  def record_not_found
    render json: { error_message: 'The recipe could not be found.'}, status: 404
  end
end