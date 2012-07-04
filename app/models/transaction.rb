class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :description, :employee_id, :method, :transType
  
  validates :account_id, :presence => true
  #validates :amount, :greater_than => 0
  validates :employee_id, :presence =>true
  validates :method, :presence => true
  #validates :type, :presence=> true
  
end
