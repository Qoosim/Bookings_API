FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'qoosim@gmail.com' }
    password { 'password' }
    # password_confirmation { 'password' }
  end
end
