class Branch < ActiveRecord::Base
  attr_accessible :city, :location, :state
  
  has_many :accounts
  has_many :employees
  
  validates :city, :presence => true
  validates :location, :presence => true
  validates :state,:presence => true
end
