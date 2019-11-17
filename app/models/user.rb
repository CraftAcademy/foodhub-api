# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :recipes
  has_one :cookbook
  has_many :favorites, through: :cookbook, class_name: 'Recipe'
end
