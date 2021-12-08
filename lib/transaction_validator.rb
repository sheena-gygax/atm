class TransactionValidator
  def initialize(account_id:, transaction_type:, amount:)
    @account_id = account_id
    @type = transaction_type
    @amount = amount
    @account = Account.find @account_id.to_i
    @errors = []
  end

  def perform
    if @account.present? && @type=='withdraw'
      validate_withdraw_transaction
    end
    @errors
  end

  private

  def validate_withdraw_transaction
    @errors << 'Funds not sufficient' if @account.balance - @amount.try(:to_f) < 0
  end
end
