class Recipes::ShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :ingredients, :directions, :user_name, :user_id, :image, :rating, :user_rating, :added_to_user_cookbook, :description

  has_one :parent, serializer: Parents::ShowSerializer

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

  def added_to_user_cookbook
    return false unless current_user.present? && current_user.cookbook.present?
    
    if current_user.cookbook.recipes.where(id: object.id).empty?
      false
    else
      true
    end
  end

  def user_rating
    return nil unless current_user.present?
    
    current_user_recipe_rating = current_user.ratings.where(recipe_id: object.id)
    if current_user_recipe_rating.empty?
      return nil
    else
      return current_user_recipe_rating.first.score 
    end
  end

  def rating
    return nil if object.ratings.empty?

    object.ratings.sum(&:score)/object.ratings.count
  end
end