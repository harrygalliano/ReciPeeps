class AddRecipesIdToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :recipe_id, :integer, null: false
    add_foreign_key :ingredients, :recipes
  end
end
