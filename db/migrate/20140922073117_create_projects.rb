class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :id
      t.string :name
      t.string :description
      t.integer :creator
      t.integer :state

      t.timestamps
    end
  end
end
