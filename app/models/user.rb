class User < ApplicationRecord
  has_many :goals, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true

  has_secure_password
end
