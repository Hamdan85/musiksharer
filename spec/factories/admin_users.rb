FactoryGirl.define do
  factory :admin_user do
    email 'admin@musiksharer.com'
    password 'secure@password'
    password_confirmation 'secure@password'
  end
end
