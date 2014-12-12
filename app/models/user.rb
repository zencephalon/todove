class User < ActiveRecord::Base
  has_secure_password
  # Remember to create a migration!
  has_many :tasks

  def top_level_tasks
    self.tasks.select {|t| t.parent_id.nil?}
  end
end
