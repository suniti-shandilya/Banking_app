class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :authentication_keys => [:loginID]
  #devise :database_authenticatable, :authentication_keys => [:loginID]

  devise :database_authenticatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :loginID, :password, :password_confirmation, :remember_me
  attr_accessible :address, :branch_id, :employeeRole, :fullName, :phone,:email

  belongs_to :branch

  validates :loginID,:presence => true
  validates :password, :presence => true, :on => :create
  validates :email, :presence => true
  validates :fullName, :presence => true
  validates :address, :presence => true
  validates :phone, :presence => true
  validates :employeeRole,:presence => true
  validates :branch_id, :presence => true
  validate :validate_branch

  private
  def validate_branch
    if !branch_id.nil? && Branch.find_by_id(self.branch_id).nil?
      errors.add(:branch_id, "Invalid")
    end
  end

end
