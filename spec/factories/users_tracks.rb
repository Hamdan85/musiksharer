FactoryGirl.define do
  factory :users_track do
    association :user, factory: :user
    association :track, factory: :track

    trait :invalid_user do
      user nil
    end

    trait :invalid_track do
      track nil
    end
  end
end
