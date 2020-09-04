FactoryBot.define do
  factory :appointment do
    date { Faker::Date.date }
    time { Faker::Time.time }
    location { Faker::Providers.geo }
    user_id { nil }
    bike_id { nil }
    # bike_id { "#{bike_id}" }
  end
end
