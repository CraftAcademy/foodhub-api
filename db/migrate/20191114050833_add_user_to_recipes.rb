class AddUserToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :user, foreign_key: true
  end
end
