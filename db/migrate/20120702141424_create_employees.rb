class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|

      t.string :fullName
      t.string :address
      t.string :phone
      t.string :employeeRole
      t.string :email
      
      t.references :branch
      
      t.timestamps
    end
  end
end
