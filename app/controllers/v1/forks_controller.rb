class ForksController < ApplicationController
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:id])
    recipe_to_fork = recipe.fork(current_user)
  end
end
