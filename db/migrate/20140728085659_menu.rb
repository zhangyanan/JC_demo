class Menu < ActiveRecord::Migration
  def up
    create_table :menus do |t|
      t.integer :id
      t.string :name
      t.integer :parent_menu_id
      t.string :url
      t.integer :right_id
      t.string :state

      t.timestamps
    end
  end

  def down
  end
end
