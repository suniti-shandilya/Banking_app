class Account < ActiveRecord::Base
  attr_accessible :accountType, :balance, :branch_id, :customer_id, :minBalance
  
  belongs_to :customer
  belongs_to :branch
  
 # validates :balance, :greater_than => 0
 # validates :minBalance, :greater_than => 0
  validates :customer_id, :presence =>true
  validates :accountType, :presence=>true
end
