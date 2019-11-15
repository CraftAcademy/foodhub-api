class AddParentIdToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :parent_id, :integer, foreign_key: true
  end
end
