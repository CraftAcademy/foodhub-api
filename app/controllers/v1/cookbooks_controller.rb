# frozen_string_literal: true

class V1::CookbooksController < ApplicationController
  before_action :authenticate_user!
  def create
    file = BookGeneratorService.generate_book(current_user.cookbook.recipes)
    if current_user.cookbook.pdf.attach(io: File.open(file),
                                        filename: 'attachment.pdf')
      attachment_url = if Rails.env.test?
                         rails_blob_url(current_user.cookbook.pdf)
                       else
                         current_user.cookbook.pdf.service_url(expires_in: 1.hour, disposition: 'inline')
                        end
      render json: {
        message: 'The cookbook was generated and is available for download',
        url: attachment_url
      }, status: 201
    end
  end
end
