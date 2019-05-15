class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.text :description, null: false
      t.integer :recipe_id, null: false

      t.timestamps
    end
    add_foreign_key :steps, :recipes
  end
end
