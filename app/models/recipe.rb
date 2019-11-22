class Recipe < ApplicationRecord
  validates_presence_of :title, :ingredients, :directions
  validates_length_of :ingredients, maximum: 500
  validates_length_of :directions, maximum: 5000
  has_one_attached :image
  belongs_to :user
  belongs_to :parent, class_name: 'Recipe', optional: true
  has_many :ratings

  def fork(user, params)
    forked_recipe = self.dup
    attributes = {
      title: params[:title],
      ingredients: params[:ingredients],
      directions: params[:directions],
      user_id: user.id,
      parent_id: self.id
    }
    forked_recipe.update(attributes)
    return forked_recipe
  end
end
