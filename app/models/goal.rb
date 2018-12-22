class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates_associated :category, message: "name cannot be blank or a duplicate"

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  def incomplete_tasks
    tasks.incomplete
  end

  def completed_tasks
    tasks.completed
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category ? self.category.name : nil
  end
end
