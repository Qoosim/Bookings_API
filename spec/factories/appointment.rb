FactoryBot.define do
  factory :appointment do
    user_id { "#{user_id}" }
    bike_id { "#{bike_id}" }
    date { Faker::Date.date }
    time { Faker::Time.time }
    location { 'Lagos Island' }
  end
end
