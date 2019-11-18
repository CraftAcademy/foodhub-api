class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :recipes, through: :favorites
end
