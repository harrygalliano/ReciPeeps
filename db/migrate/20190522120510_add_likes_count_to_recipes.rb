class AddLikesCountToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :likes_count, :integer
    Recipe.find_each do |recipe|
     Recipe.reset_counters(recipe.id, :likes)
    end
  end




end
