FactoryBot.define do
  factory :bike do
    brand Faker::DrWho.character
    model Faker::DrWho.specie
    station_id Station.order("RANDOM()").first.id
  end
end