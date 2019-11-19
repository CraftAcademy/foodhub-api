class Cookbook::Serializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :cookbook_recipes

  def cookbook_recipes
    object.favorites.map do |favorite|
      {
        id: favorite.recipe_id,
        title: favorite.recipe.title,
        user_name: favorite.recipe.user.name,
        image: Rails.env === 'test' ? rails_blob_url(favorite.recipe.image) : favorite.recipe.image.service_url(expires_in: 1.hour, disposition: 'inline')
      }
    end
  end
end
