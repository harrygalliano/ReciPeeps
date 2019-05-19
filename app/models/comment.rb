class Comment < ApplicationRecord
  validates :comment, :user_id, :recipe_id, presence: true
end
