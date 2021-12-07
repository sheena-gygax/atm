require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:account) { FactoryBot.create(:account) }

  it { should belong_to(:account) }
  it { should validate_presence_of(:account) }
  it { should validate_presence_of(:amount) }
  
  context '#default_transaction_number' do
    it 'sets transactiom number' do
      transaction = Transaction.create(account_id: account.id, transaction_type: 'withdraw', amount: 500.00)
      expect(transaction.transaction_number).to be_present
      expect(transaction.valid?).to be true
    end
  end
end
