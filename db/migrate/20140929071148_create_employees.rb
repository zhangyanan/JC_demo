class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :id
      t.string :name
      t.string :code
      t.string :sex
      t.datetime :birthday
      t.integer :department_id
      t.string :remark
      t.string :state
      t.datetime :expired_at

      t.timestamps
    end
  end
end
