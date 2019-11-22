# frozen_string_literal: true

class V1::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_cookbook_exist

  def index
    cookbook = current_user.cookbook
    render json: cookbook, serializer: Cookbook::Serializer
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    if current_user.cookbook.recipes.where(id: recipe.id).empty?
      favorite = current_user.cookbook.favorites.create(recipe: recipe)

      if favorite.persisted?
        render json: {message: 'The recipe was successfully added to your favorites'}, status: 201
      end
    else     
      render json: {message: 'You have already added this recipe to your cookbook'}, status: 409
    end
    
  end

  private

  def verify_cookbook_exist
    Cookbook.create(user: current_user) unless current_user.cookbook
  end
end
