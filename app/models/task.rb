class Task < ActiveRecord::Base
  belongs_to :user

  def toggle_complete!
    self.completed = !self.completed
    self.save
  end
end