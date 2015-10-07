FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'abcd1234'
    role 'user'

    trait :admin do
      role 'admin'
    end

    trait :guest do
      role 'guest'
    end
  end
end
