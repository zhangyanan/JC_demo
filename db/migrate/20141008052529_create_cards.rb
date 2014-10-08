class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :id
      t.integer :employee_id
      t.string :card_number
      t.datetime :created_at
      t.datetime :update_at
      t.datetime :lost_at

      t.timestamps
    end
  end
end
