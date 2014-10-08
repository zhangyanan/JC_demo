class AddCardNumbertoCards < ActiveRecord::Migration
  def up
    add_column :cards,:card_number,:string
  end

  def down
    remove_column :card_number
  end
end
