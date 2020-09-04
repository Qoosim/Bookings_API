FactoryBot.define do
  factory :bike do
    # model { Faker::Vehicle.model }
    model { 'Classic 350' }
    # color { Faker::Vehicle.color }
    color { 'red' }
    # price { Faker::Currency.symbol }
    price { '$70000' }
    weight { '192kg' }
    engine_capacity { '346.0 CC' }
    # price { Faker::Currency.symbol}{ range(70000, 1000000) }
  end
end
