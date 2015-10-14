FactoryGirl.define do
  factory :item do
    content { Faker::Lorem.word }
    list
  end
end
