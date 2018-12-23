class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :tasks, through: :goals
  has_many :categories, through: :goals

  validates :username, presence: true
  validates :username, uniqueness: true

  has_secure_password

  def self.find_or_create_with_facebook(auth)
    find_or_create_by(uid: auth['uid']) do |user|
      user.username = auth['info']['name']
      user.password = SecureRandom.hex
    end
  end

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
