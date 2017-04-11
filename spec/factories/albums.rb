FactoryGirl.define do
  factory :album do
    name "MyString"
    cover_url "MyString"

    association :artist, factory: :artist
  end
end
