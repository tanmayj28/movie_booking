FactoryGirl.define do
  factory :audi_screen do
    capacity 100
    movie_name 'Harry Potter'
    association :booking_theatre, factory: :booking_theatre, strategy: :create
    association :show_time, factory: :show_time, strategy: :create
  end
end
