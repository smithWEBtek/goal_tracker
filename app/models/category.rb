class Category < ApplicationRecord
  has_many :goals
  has_many :users, through: :goals

  validates :name, presence: { message: "of category can't be blank" }
  validates :name, uniqueness: { case_sensitive: false, message: "of category has already been taken. Please select the existing version" }

  before_save { self.name = name.downcase }

  scope :most_popular, -> (limit) { joins(:goals).group(:id).order("COUNT(categories.id) desc").limit(limit) }
end
