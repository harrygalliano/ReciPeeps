class AddServingsAndCookingTimeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :serving, :integer
    add_column :recipes, :cooking_time, :string
  end
end
