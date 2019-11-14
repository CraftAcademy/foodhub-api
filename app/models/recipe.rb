class Recipe < ApplicationRecord
  validates_presence_of :title, :ingredients, :directions
  validates_length_of :ingredients, maximum: 500
  validates_length_of :directions, maximum: 5000
  has_one_attached :image
  belongs_to :user
end
