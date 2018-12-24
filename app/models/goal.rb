class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tasks, dependent: :destroy

  validates :name, presence: { message: "of goal can't be blank" }

  validate do |goal|
    goal.category.errors.full_messages.each { |msg| errors[:base] << msg }
  end

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
  scope :most_recently_created, -> (limit) { order("created_at desc").limit(limit) }

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category ? self.category.name : nil
  end

  def incomplete_tasks
    tasks.incomplete
  end

  def completed_tasks
    tasks.completed
  end

  def status
    completed ? "completed" : "ongoing"
  end

  def display_summary
    summary.blank? ? "none available" : summary
  end
end
