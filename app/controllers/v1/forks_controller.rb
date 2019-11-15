class V1::ForksController < ApplicationController
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:recipe_id])
    forked_recipe = recipe.fork(current_user)
  end
end
