FactoryBot.define do
  factory :item do
    name {Faker::Appliance.equipment}
    unit_price {Faker::Number.number(digits: 4)}
    description {Faker::Quote.famous_last_words}
    merchant
  end
end