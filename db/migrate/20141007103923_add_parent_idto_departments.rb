class AddParentIdtoDepartments < ActiveRecord::Migration
  def up
    add_column :departments, :parent_id,:integer
  end

  def down
    remove_column :parent_id
  end
end
