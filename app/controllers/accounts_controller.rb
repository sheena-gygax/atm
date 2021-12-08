class AccountsController < ApplicationController
  before_action :get_customer
  before_action :set_accounts, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.where(customer_id: params['customer_id'])
  end

  def new
    @account = Account.new customer_id: params['customer_id'] 
  end

  def create
    @account = Account.new customer_id: params['customer_id']

    if @account.save
      redirect_to customer_accounts_path(@customer)
    else
      render 'accounts/new'
    end
  end

  def show
    @account = Account.find params['id']
    if @account.present?
      render 'accounts/show'
    else 
      render 'accounts/new'
    end
  end

  private

  def permitted_params
    params.require(:account).permit(:balance, transaction_attributes: { })
  end

  def get_customer
    @customer = Customer.find_by id: params['customer_id']
  end

  def set_accounts
    @accounts = @customer.accounts
  end
end