class Recipes::IndexSerializer < ActiveModel::Serializer
  
  attributes :id, :title, :ingredients, :directions
end
