FactoryBot.define do
  factory :user do
    name Faker::Simpsons.character
    email Faker::Internet.safe_email
    password "1!2@3#"
    password_confirmation "1!2@3#"
  end
end