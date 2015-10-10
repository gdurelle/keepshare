FactoryGirl.define do
  factory :item do
    content { Faker::Lorem.word }
    list_id 1
  end
end
