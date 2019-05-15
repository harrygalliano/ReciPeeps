class Step < ApplicationRecord
    validates :description, :recipe_id, presence: true
end
