class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.integer :operation
      t.integer :state
      t.integer :creator

      t.timestamps
    end
  end
end
