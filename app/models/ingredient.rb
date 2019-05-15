class Ingredient < ApplicationRecord
  validates :name, :value, :unit, presence: true
end
