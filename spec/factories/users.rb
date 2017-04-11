FactoryGirl.define do
  factory :user do

    email Faker::Internet.email
    password 'secure@password'
    password_confirmation 'secure@password'
    name Faker::Name.name
    birthdate Faker::Date.between(20.years.ago, 18.years.ago)
  end
end
