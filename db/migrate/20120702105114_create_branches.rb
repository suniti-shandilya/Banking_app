class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :location
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
