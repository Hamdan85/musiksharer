FactoryGirl.define do
  factory :track do
    duration 1
    isrc "MyString"
    name Faker::Name.name
    audio_preview "http://www.audio.com/mp4.mp3"

    association :album, factory: :album
  end
end
