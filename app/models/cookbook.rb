class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :recipes, through: :favorites

  has_one_attached :pdf
end
