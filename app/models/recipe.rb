class Recipe < ApplicationRecord
  validates :name, :description, presence: true
end
