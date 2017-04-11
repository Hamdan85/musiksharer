FactoryGirl.define do
  factory :album do
    name Faker::Name.name
    cover_url "MyString"

    association :artist, factory: :artist
  end
end
