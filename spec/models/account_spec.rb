require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  it { should belong_to(:customer) }
  it { should have_many(:transactions) }

  context 'validations' do
    it { should validate_presence_of(:customer) }

    context 'account_number' do
      it 'is not valid' do
        account = Account.create(account_number: nil, balance: 10.00)
        expect(account.account_number).not_to be_nil
      end
    end
  end

  context '#default_account_number' do
    it 'sets account number' do
      account = Account.create(customer_id: customer.id)
      expect(account.account_number).to be_present
      expect(account.save).to be true
    end
  end

  context '#default_balance' do
    let(:account) { FactoryBot.create(:account, :without_account_number) }

    it 'sets default balance' do
      expect(account.balance).to eq(0.0)
    end
  end 
end
