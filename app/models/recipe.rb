# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, :description, :user_id, :preparation_time, :servings, presence: true
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :favourites, dependent: :destroy
end
