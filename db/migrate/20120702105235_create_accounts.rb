class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.string :accountType
      t.integer :balance
      t.integer :minBalance

      t.references :branch
      
      t.timestamps
    end
  end
end
