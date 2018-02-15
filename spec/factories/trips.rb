FactoryBot.define do
  factory :trip do
    start_latlng { [Faker::Address.latitude, Faker::Address.longitude] }
    end_latlng { [Faker::Address.latitude, Faker::Address.longitude] }
    status 0
  end
end
