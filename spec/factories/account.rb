FactoryBot.define do
  factory :account do
    customer
    balance  { Faker::Number.decimal(l_digits: 2) }
    account_number { Faker::Bank.account_number(digits: 10) }

    trait :without_account_number do
      account_number { nil }
    end
  end
end