class V1::RecipesController < ApplicationController

  def index
    recipes = Recipe.all

    if recipes.empty?
      render_message('There are no recipes here')
    else 
      render json: recipes
    end
  end
end