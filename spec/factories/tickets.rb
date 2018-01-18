FactoryGirl.define do
  factory :ticket do
    seat 80
    association :show_time, factory: :show_time, strategy: :create
    association :movie, factory: :movie, strategy: :create
    association :audi_screen, factory: :audi_screen, strategy: :create
    association :customer, factory: :customer, strategy: :create
  end
end
