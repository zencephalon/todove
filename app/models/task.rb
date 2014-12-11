class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description, :priority

  def toggle_complete!
    self.completed = !self.completed
    self.save
  end
end