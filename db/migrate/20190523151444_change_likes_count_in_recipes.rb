class ChangeLikesCountInRecipes < ActiveRecord::Migration[5.2]
  def change
    Recipe.where(likes_count: nil).update_all(likes_count: 0)
    change_column :recipes, :likes_count, :integer, :default => 0
  end
end
