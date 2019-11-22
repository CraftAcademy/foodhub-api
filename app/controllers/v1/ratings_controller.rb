class V1::RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    recipe = Recipe.find(params[:recipe_id])
    if recipe.user_id != current_user.id
      if current_user.ratings.where(recipe_id: recipe.id).empty?
        rating = current_user.ratings.create(score: params[:score], recipe: recipe)
      else
        rating = current_user.ratings.where(recipe_id: recipe.id).first
        rating.update(score: params[:score])
      end
      
      if rating.persisted? || rating.changed?
        render status: 201
      else
        render json: {error_message: 'Something went wrong, your rating has not been saved'}, status: 400
      end
    else
      render json: {error_message: 'You cannot rate your own recipe'}, status: 409
    end    
  end
end
