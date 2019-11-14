class RenameRecipeIdColumnInRecipe < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :recipes_id, :forked_from_recipe_id
  end
end
