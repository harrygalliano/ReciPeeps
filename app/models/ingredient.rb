class Ingredient < ApplicationRecord
  validates :name, :value, :unit, :recipe_id, presence: true
end
