class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.string :transType
      t.string :method
      t.string :description
      t.integer :employee_id
      t.integer :amount

      t.timestamps
    end
  end
end
