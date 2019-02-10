FactoryGirl.define do
  factory :product do
    name               Faker::Pokemon.name
    status             1
    shipping_method    1
    region             Faker::Address.state
    shipping_timetable 1
    description        Faker::Lorem.sentence
    price              1
    shipping_burden    1
    association :seller, factory: :user
  end
end
