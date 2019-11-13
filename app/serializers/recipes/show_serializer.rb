class Recipes::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :ingredients, :directions
end
