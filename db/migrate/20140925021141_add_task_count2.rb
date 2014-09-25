class AddTaskCount2 < ActiveRecord::Migration
  def up
    add_column :projects, :tasks_count, :integer, :default => 0
    Project.reset_column_information
    Project.all.each do |p|
      Project.update_counters p.id, :tasks_count => p.tasks.length
    end
  end

  def down
    remove_column :projects, :tasks_count
  end
end
