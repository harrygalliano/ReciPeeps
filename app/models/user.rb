# frozen_string_literal: true

class User < ApplicationRecord
  # before_save { self.email = email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /@/.freeze
  validates :email, presence: true, length: { maximum: 60 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :likes, dependent: :destroy
end
