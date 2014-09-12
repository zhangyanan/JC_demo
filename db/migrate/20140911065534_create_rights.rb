class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.integer :state

      t.timestamps
    end
  end
end
