class CreateTerminals < ActiveRecord::Migration
  def change
    create_table :terminals do |t|
      t.integer :id
      t.string :name
      t.string :state
      t.string :remote_id

      t.timestamps
    end
  end
end
