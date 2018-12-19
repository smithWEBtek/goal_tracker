class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  has_secure_password
end
