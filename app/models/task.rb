class Task < ActiveRecord::Base
  belongs_to :user

  def complete!
    self.completed = true
    self.save
  end
end