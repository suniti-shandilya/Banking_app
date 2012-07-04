class CreateCustomers < ActiveRecord::Migration

def change
    create_table :customers do |t|
      t.string  :fullName
      t.string  :email
      t.text    :address
      t.string  :phone
   
    end
end

  
end
