class TransactionCreator
  def initialize(account_id:, transaction_type:, amount:)
    @account_id = account_id
    @type = transaction_type
    @amount = amount.try(:to_f)
    @account = Account.find @account_id.try(:to_i)
  end

  def perform
    Transaction.create!(
      account_id: @account_id,
      amount: @amount,
      transaction_type: @type
    )

    if @type == 'withdraw'
      @account.update!(balance: @account.balance - @amount)
    else
      @account.update!(balance: @account.balance + @amount)
    end

    @account
  end

  def balance_to_f
    @account.balance.try(:to_f)
  end
end
