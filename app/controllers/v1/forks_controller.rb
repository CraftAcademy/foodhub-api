class ForksController < ApplicationController
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:id])
  end
end
