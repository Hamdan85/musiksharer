FactoryGirl.define do
  factory :artist do
    name Faker::Name.name
    photo 'http://www.com.br/'
    genres ['Rock', 'Salsa']
  end
end
