FactoryGirl.define do
  factory :booking_theatre do
    theatre_name Faker::Name.name
    phone Faker::PhoneNumber.cell_phone
    address Faker::Address.street_address
  end
end
