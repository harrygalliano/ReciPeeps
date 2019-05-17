class AddUserIdToRecipes < ActiveRecord::Migration[5.1]
  def change
    User.create(name: 'Default', email: 'default@default.com',
       password: '123456', password_confirmation: '123456', id: -1)
    add_column :recipes, :user_id, :integer
    add_foreign_key :recipes, :users
    Recipe.where(user_id: nil).update_all(user_id: -1)
    change_column :recipes, :user_id, :integer, null: false
  end
end
