# frozen_string_literal: true

class Step < ApplicationRecord
  validates :description, :recipe_id, presence: true
end
