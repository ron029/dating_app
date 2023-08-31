# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    mobile_number { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    birthdate { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { ['male', 'female'].sample }
    country { Faker::Address.country }
    state_region { Faker::Address.state }
    city { Faker::Address.city }
    school { Faker::Educator.university }
    bio { Faker::Lorem.paragraph }
    admin { 0 }
    password { 'password123' }
    password_confirmation { 'password123' }
    sexual_orientation { ['male', 'female'].sample }
    gender_interest { ['male', 'female'].sample }
  end
end
