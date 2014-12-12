class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :description, :priority

  has_many :task_tags
  has_many :tags, through: :task_tags

  belongs_to :super_task, foreign_key: :parent_id, class_name: "Task"
  has_many :sub_tasks, foreign_key: :parent_id, class_name: "Task", table_name: :tasks

  def toggle_complete!
    self.completed = !self.completed
    self.save
  end

  def set_tags_from_str(tag_str)
    self.tags.clear
    tag_str.split(",").map {|tag| tag.strip}.uniq.each do |tag|
      t = Tag.find_or_create_by(name: tag)
      self.tags << t
    end
  end

  def display_tags
    self.tags.map {|t| t.name}.join(", ")
  end
end