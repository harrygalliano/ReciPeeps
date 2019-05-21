# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
end
