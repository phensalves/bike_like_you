FactoryBot.define do
  factory :station do
    name Faker::Address.city
  end
end