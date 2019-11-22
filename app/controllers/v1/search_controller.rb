# frozen_string_literal: true

class V1::SearchController < ApplicationController
  def create
    RecipesIndex.import
    query = RecipesIndex.query(multi_match: {
                                 query: params[:q],
                                 fields: %i[title directions ingredients],
                                 fuzziness: 'AUTO'
                               })
    if query.any?
      render json: query.objects, each_serializer: Recipes::IndexSerializer
    else
      render json: { message: 'Your search yielded no results' }, status: 404
    end
  end
end
