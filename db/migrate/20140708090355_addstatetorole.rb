class Addstatetorole < ActiveRecord::Migration
  def up
    add_column :roles, :state, :string, default: 1
  end

  def down
  end
end
