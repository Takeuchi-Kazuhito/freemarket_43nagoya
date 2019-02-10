FactoryGirl.define do
  factory :user do
    family_name     Faker::Name.last_name
    first_name      Faker::Name.first_name
    family_katakana Faker::Name.last_name
    first_katakana  Faker::Name.first_name
    domicile_pref   Faker::Address.state
    domicile_city   Faker::Address.state
    domicile_add    Faker::Address.state
    birthday        "1000-01-01"
    phone_number    "00000000000"
    nickname        Faker::Artist.name
    sequence(:email) { Faker::Internet.email }
    password        "password"
  end
end
