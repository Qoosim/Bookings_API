FactoryBot.define do
  factory :bike do
    model { 'Royal Enfield Classic 350' }
    color { 'red' }
    price { "$700000" }
    weight { '192kg' }
    engine_capacity { '346.0 CC' }
  end
end