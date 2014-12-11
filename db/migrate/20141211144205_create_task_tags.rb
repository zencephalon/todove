class CreateTaskTags < ActiveRecord::Migration
  def change
    create_table :task_tags do |t|
      t.references :task
      t.references :tag
    end
  end
end
