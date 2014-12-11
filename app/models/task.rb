class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description, :priority

  has_many :task_tags
  has_many :tags, through: :task_tags

  def toggle_complete!
    self.completed = !self.completed
    self.save
  end
end