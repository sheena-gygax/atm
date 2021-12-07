FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    pin_number { Faker::Number.number(digits: 4) }
  end
end