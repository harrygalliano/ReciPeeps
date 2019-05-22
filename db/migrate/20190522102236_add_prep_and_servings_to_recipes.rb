class AddPrepAndServingsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :preparation_time, :string
    add_column :recipes, :servings, :integer
  end
end
