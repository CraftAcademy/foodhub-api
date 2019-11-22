# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :recipes
  has_one :cookbook
  has_many :favorites, through: :cookbook
  has_many :favorite_recipes, through: :favorites, source: :recipe
  has_many :ratings
end
