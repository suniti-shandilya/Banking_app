class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.integer :branch_id
      t.string :accountType
      t.integer :balance
      t.integer :minBalance

      t.timestamps
    end
  end
end
