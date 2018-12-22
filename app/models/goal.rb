class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  def incomplete_tasks
    tasks.incomplete
  end

  def completed_tasks
    tasks.completed
  end
end
