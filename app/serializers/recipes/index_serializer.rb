class Recipes::IndexSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :title, :ingredients, :directions, :image, :user_id, :rating, :user_name

  def image
    return nil unless object.image.attached?
    
    if Rails.env.test?
      rails_blob_url(object.image)
    else
      object.image.service_url(expires_in: 1.hour, disposition: 'inline')
    end
  end

  def user_name
    object.user.name 
  end

  def rating
    return nil if object.ratings.empty?

    object.ratings.sum(&:score)/object.ratings.count
  end
end
