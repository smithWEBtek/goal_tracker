class Goal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
end
