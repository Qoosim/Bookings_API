FactoryBot.define do
  factory :appointment do
    date { '2020/09/03' }
    time { '02:30' }
    location { 'Lagos' }
    user_id { nil }
    bike_id { nil }
  end
end
