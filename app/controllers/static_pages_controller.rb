class StaticPagesController < ApplicationController
  
  def home
    if customer_signed_in?
      debugger
      redirect_to current_customer, :notice=> flash[:warning].to_s
    elsif employee_signed_in?
      debugger
      redirect_to current_employee, :notice=> flash[:warning].to_s
    end
  end
  
  def contact
  end
  
  def about 
    
  end
end
