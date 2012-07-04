class Customer < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :encryptable, :encryptor => :sha1base64, :authentication_keys => [:loginID]
  
  devise :database_authenticatable,:rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:password, :password_confirmation, :remember_me, :phone,:fullName,:address,:loginID
  # attr_accessible :title, :body
  
  has_many :accounts 
  
 # validates :password, :presence => true
  #validates :phone, :presence => true
  
  #validates :fullName, :presence => true
  #validates :address, :presence => true
  #validates :loginID, :presence => true
  
end
