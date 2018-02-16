FactoryBot.define do
  factory :trip do
    start_latlng { [Faker::Address.latitude, Faker::Address.longitude] }
    end_latlng { [Faker::Address.latitude, Faker::Address.longitude] }
    trait :ongoing do
      status 0
    end
    trait :completed do
      status 1
    end
  end
end
