FactoryGirl.define do
  factory :customer do
    name Faker::Name.name
    phone Faker::PhoneNumber.cell_phone
    age Faker::Number.number(2)
    gender 'male'
    association :booking_theatre, factory: :booking_theatre, strategy: :create
  end
end
