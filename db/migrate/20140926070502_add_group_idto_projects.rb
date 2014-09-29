class AddGroupIdtoProjects < ActiveRecord::Migration
  def up
    add_column :projects,:group_id,:integer
  end

  def down
    remove_column :projects,:group_id
  end
end
