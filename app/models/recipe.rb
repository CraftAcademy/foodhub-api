class Recipe < ApplicationRecord
  validates_presence_of :title, :ingredients, :directions
  validates_length_of :ingredients, maximum: 500
  validates_length_of :directions, maximum: 5000
  has_one_attached :image
  belongs_to :user
  belongs_to :recipe

  def fork(user)
    recipe_to_fork = self.dup
    attributes = { 
      title: "Forked #{self.title}",  
      user_id: user.id, 
      forked_from_id: self.id
    }
    recipe_to_fork.update_attributes(attributes)
  end
end
