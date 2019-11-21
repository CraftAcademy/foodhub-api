class V1::RatingsController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    rating = current_user.ratings.create(score: params[:score], recipe: recipe)

    if rating.persisted?
      render status: 201
    else
      render json: {error_message: 'Something went wrong, your rating has not been saved'}, status: 400
    end
  end
end
