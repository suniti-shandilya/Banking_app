class Transaction < ActiveRecord::Base
  
  attr_accessible :account_id, :amount, :description, :employee_id, :method, :transType

  validates :account_id, :presence => true
  validates :amount, :presence => true
  validates :amount, :numericality => {:greater_than => 0}
  validates :employee_id, :presence =>true
  validates :method, :presence => true
  validates :transType, :presence=> true, :inclusion => {:in => ["credit", "debit"], :message => "can only be credit or debit"}
  validate :validate_account, :validate_employee

  belongs_to :employee
  belongs_to :account
  validates_associated :account
  
  ## Conduct Transaction - debit or credit
  def conductTransaction
    raise unless @transaction.valid?
    case transType
    when "debit"
      debit
    when "credit"
      credit
    else
    raise "Invalid transaction type"
    end
  end

private
  #For debit, reduce amount from account
  def debit
    if(account.balance - amount >= account.minBalance)
      account.balance -= amount
    else
      raise "Minnimum balance crossed, hence transaction failed."
    end
  end
  
  #For credit, add amount to account
  def credit
    account.balance += amount
  end

  ## Validates if accountID entered is correct
  def validate_account
    if !account_id.nil? && Account.find_by_id(self.account_id).nil?
      errors.add(:account_id, "Invalid")
    end
  end
  
  ## Validates if employeeID entered is correct
  def validate_employee
    if !employee_id.nil? && Employee.find_by_id(self.employee_id).nil?
      errors.add(:employee_id, "Invalid")
    end
  end
end
