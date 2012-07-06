class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|

      t.string :transType
      t.string :method
      t.string :description
      t.integer :amount

      t.references :account
      t.references :employee
     
      t.timestamps
    end
  end
end
