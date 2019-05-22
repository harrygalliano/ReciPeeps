# frozen_string_literal: true

class Favourite < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
end
