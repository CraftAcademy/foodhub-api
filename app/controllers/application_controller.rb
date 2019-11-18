# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def attach_image(recipe)
    params_image = params['recipe']['image']
    if params_image && params_image.present?
      DecodeService.attach_image(params_image, recipe.image)
    end
  end

  def user_not_authorized
    render json: {error_message: 'You are not authorized to perform this action.'}, status: 401
  end
end
