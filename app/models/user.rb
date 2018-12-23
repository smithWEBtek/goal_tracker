class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :tasks, through: :goals
  has_many :categories, through: :goals

  validates :username, presence: true
  validates :username, uniqueness: true

  has_secure_password

  def incomplete_goals
    goals.incomplete
  end

  def completed_goals
    goals.completed
  end

  def incomplete_goals_with_tasks
    incomplete_goals.reject { |goal| goal.incomplete_tasks.empty? }
  end
end
