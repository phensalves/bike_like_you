FactoryBot.define do
  factory :trip do
    origin_station Station.first.name
    final_station nil
    start_date  "2018-03-29 16:51:56"
    end_date    nil
    distance    nil
    created_at "2018-03-29 16:51:56"
    updated_at "2018-03-29 16:51:56"
    bike_id Bike.first.id
    user_id User.first.id

    trait :initialized do
      condition {'initialized'}
    end
  end
end