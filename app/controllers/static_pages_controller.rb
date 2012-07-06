class StaticPagesController < ApplicationController
  def home
    flash.keep
    if customer_signed_in?
      redirect_to current_customer
    elsif employee_signed_in?
      redirect_to current_employee
    end
  end

  def contact
  end

  def about

  end
end
