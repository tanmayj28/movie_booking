FactoryGirl.define do
  factory :show_time do
    movie_time '2018-01-11 21:53:09'
    association :movie, factory: :movie, strategy: :create
  end
end
