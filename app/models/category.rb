class Category < ApplicationRecord
  has_many :goals
  has_many :users, through: :goals

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
