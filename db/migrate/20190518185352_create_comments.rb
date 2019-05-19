class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :recipe_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :recipes
  end
end
