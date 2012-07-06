class Account < ActiveRecord::Base
  
  attr_accessible :accountType, :balance, :branch_id, :customer_id, :minBalance

  belongs_to :customer
  belongs_to :branch
  has_many :transactions
  
  validates :balance, :numericality => {:greater_than_or_equal_to => 0}
  validates :minBalance, :numericality => {:greater_than_or_equal_to => 0}
  validates :customer_id, :presence =>true
  validates :branch_id, :presence =>true
  validates :accountType, :presence => true
  validate :validate_customer,:validate_branch, :validate_balance

  private
  ## Validates if customer ID mentioned is correct or not
  def validate_customer
    if !customer_id.nil? && Customer.find_by_id(self.customer_id).nil?
      errors.add(:customer_id, "Invalid")
    end
  end

  ## Validates if branch ID mentioned is correct or not
  def validate_branch
    if !branch_id.nil? && Branch.find_by_id(self.branch_id).nil?
      errors.add(:branch_id, "Invalid")
    end
  end
  
  ## Validates if balance value is always less than minBalance
  def validate_balance
    if (!balance.nil? && !minBalance.nil?) && balance < minBalance
      errors.add(:balance, "cannot be less than minimum balance")
    end
  end
end
