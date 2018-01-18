FactoryGirl.define do
  factory :movie do
    name 'Harry Potter'
    audi_no 1
    rating 4
    association :booking_theatre, factory: :booking_theatre, strategy: :create
  end
end
