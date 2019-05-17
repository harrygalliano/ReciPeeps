class Recipe < ApplicationRecord
  validates :name, :description, :user_id, presence: true
end
