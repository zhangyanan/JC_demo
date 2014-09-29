class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :id
      t.integer :terminal_id
      t.string :in_out

      t.timestamps
    end
  end
end
