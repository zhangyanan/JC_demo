class CreateOvertimes < ActiveRecord::Migration
  def change
    create_table :overtimes do |t|
      t.integer :id
      t.integer :employee_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :description

      t.timestamps
    end
  end
end
