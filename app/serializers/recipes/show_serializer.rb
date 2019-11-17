class Recipes::ShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :ingredients, :directions, :user_name, :user_id, :image

  def image
    if object.image.attached?
      if Rails.env.test?
        rails_blob_url(object.image)
      else
        object.image.service_url(expires_in: 1.hour, disposition: 'inline')
      end
    end
  end

  def user_name
    object.user.name
  end
end
