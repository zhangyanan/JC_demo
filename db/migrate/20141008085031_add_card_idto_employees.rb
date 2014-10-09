class AddCardIdtoEmployees < ActiveRecord::Migration
  def up
    add_column :employees,:card_id,:integer
  end

  def down
    remove_column :card_id
  end
end
