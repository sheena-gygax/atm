require 'rails_helper'

RSpec.describe Customer, :type => :model do
  it { should have_many(:accounts) }
  it { should validate_presence_of(:pin_number) }
  it { should validate_uniqueness_of(:pin_number) }

  context 'when pin number too long' do
    let(:customer) { FactoryBot.build(:customer, pin_number: '12345') }

    it 'is not valid' do
      expect(customer).to_not be_valid
    end
  end
end
