class AddEmployeeIdtoCards < ActiveRecord::Migration
  def up
    add_column :cards,:employee_id,:integer
  end

  def down
    remove_column :employee_id
  end
end
