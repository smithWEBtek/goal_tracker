class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def status
    completed ? "Completed" : "In Progress"
  end
end
