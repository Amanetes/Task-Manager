# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i, message: 'Email invalid' },
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 4, maximum: 254 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
