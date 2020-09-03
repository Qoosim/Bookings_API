FactoryBot.define do
  factory :bike do
    model { 'Royal Enfield Classic 350' }
    color { 'red' }
    price { "$700000" }
    # price { Faker::Currency.symbol}{ range(70000, 1000000) }
    # "{Faker::Currency.symbol}{range(70000, 1000000)}"
    weight { '192kg' }
    engine_capacity { '346.0 CC' }
  end
end