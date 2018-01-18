FactoryGirl.define do
  factory :seat_type do
    seat_class 'silver'
    association :ticket, factory: :ticket, strategy: :create
  end
end
