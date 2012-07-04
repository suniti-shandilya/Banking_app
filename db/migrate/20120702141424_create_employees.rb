class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :branch_id
      t.string :fullName
      t.string :address
      t.string :phone
      t.string :employeeRole

      t.timestamps
    end
  end
end
