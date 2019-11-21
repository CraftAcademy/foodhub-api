class Cookbook::Serializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :cookbook_recipes

  def cookbook_recipes
    object.favorites.map do |favorite|
      {
        id: favorite.recipe_id,
        title: favorite.recipe.title,
        user_name: favorite.recipe.user.name,
        image: image(favorite)
      }
    end
  end

  def image(favorite)
    return nil unless favorite.recipe.image.attached?

    if Rails.env === 'test'
      rails_blob_url(favorite.recipe.image)
    else
      favorite.recipe.image.service_url(expires_in: 1.hour, disposition: 'inline')
    end
  end
end
