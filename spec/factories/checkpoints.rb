FactoryBot.define do
  factory :checkpoint do
    latlng { [Faker::Address.latitude, Faker::Address.longitude] }
  end
end
