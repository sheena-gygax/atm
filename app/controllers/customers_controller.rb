class CustomersController < ApplicationController
  def show
    @customer = Customer.find(params['id'])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session['customer_id'] = @customer.id
      redirect_to customer_accounts_path(@customer)
    else
      render 'new'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :pin_number)
  end
end