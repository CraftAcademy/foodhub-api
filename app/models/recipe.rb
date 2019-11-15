class Recipe < ApplicationRecord
  validates_presence_of :title, :ingredients, :directions
  validates_length_of :ingredients, maximum: 500
  validates_length_of :directions, maximum: 5000
  has_one_attached :image
  belongs_to :user

  def fork(user)
    forked_recipe = self.dup
    attributes = { 
      title: "Forked #{self.title}",  
      user_id: user.id, 
      forked_from_recipe_id: self.id
    }
    forked_recipe.update(attributes)
    return forked_recipe
  end
end
