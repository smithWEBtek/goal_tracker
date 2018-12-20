class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :tasks, through: :goals
  
  validates :username, presence: true
  validates :username, uniqueness: true

  has_secure_password
end
