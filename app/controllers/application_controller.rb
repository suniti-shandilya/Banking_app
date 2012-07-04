class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :customer_signed_in?, :employee_signed_in?,:current_customer,:current_employee,:get_Customer_Account
  helper_method :is_manager?
  
  def is_manager?
    unless employee_signed_in? && current_employee.employeeRole == "manager"
      return false
    end
    return true
  end
  
  def after_sign_in_path_for(resource_or_scope)
    if customer_signed_in?
      customer_path(current_customer)
    elsif employee_signed_in?
      employee_path(current_employee)
    else
      super
    end
  end

  def get_Customer_Account
    if customer_signed_in?
      @accountsByCust = Account.where(:customer_id => current_customer.id)
      return @accountsByCust
    end
  end

  def authenticate_user
    if customer_signed_in? || employee_signed_in?
      return true
    end
    flash[:warning]='Please login to continue'
    #session[:return_to]=request.request_uri
    redirect_to :controller => "static_pages", :action => "home"
    return false 
    
  end
  
  def authenticate_manager
    if is_manager?
      return true
    end
    flash[:warning]='You need to be a manager to access this record.'
    #session[:return_to]=request.request_uri
      redirect_to :controller => "static_pages", :action => "home"
    return false 
    
  end
  
  def authenticate_employee
    if employee_signed_in?
      return true
    else
      redirect_to :controller => "static_pages", :action => "home"
    end
  end

   def debit(accountNumber, amount)
    debugger
    account = Account.find(accountNumber)
    account.balance -= amount
    debugger
    if(account.balance >= account.minBalance)
      account.save
    else
      raise "Miminum balance exceeded, hence transaction failed."
    end
  end
  
  def credit(accountNumber, amount)
    debugger
    account =Account.find(accountNumber)
    account.balance += amount
    debugger
    account.save
  end
  
end
