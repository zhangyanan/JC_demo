class AddprojectUrltoprojects < ActiveRecord::Migration
  def up
    add_column :projects,:project_url,:string
  end

  def down
    remove_column :projects,:project_url
  end
end
