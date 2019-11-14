class AddForkedIdToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :recipes, foreign_key: true
  end
end
