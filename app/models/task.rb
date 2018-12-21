class Task < ApplicationRecord
  belongs_to :goal

  validates :name, presence: true

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end
