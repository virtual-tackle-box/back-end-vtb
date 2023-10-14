class User < ApplicationRecord
  has_many :lures, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
end