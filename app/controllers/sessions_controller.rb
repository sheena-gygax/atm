class SessionsController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.find_by pin_number: params['session']['pin_number']

    if customer
      session['customer_id'] = customer.id
      redirect_to customer_accounts_path(customer)
    else
      flash[:danger] = 'Invalid pin'
      render 'new'
    end
  end

  def destroy
    session.delete 'customer_id'
    @current_customer = nil
    redirect_to login_path
  end
end