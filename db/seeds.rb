# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do
  user            = User.create(
                      email: Faker::Internet.safe_email,
                      name: Faker::Simpsons.character,
                      password: "123!@#",
                      password_confirmation: "123!@#"
                    )

  station         = Station.create(
                      name: Faker::Address.city
                    )

  bike            = Bike.create(
                      brand: Faker::DrWho.character,
                      model: Faker::DrWho.specie,
                      station_id: station.id
                    )

  trip            =  Trip.create(
                      origin_station: station.name,
                      final_station: Faker::Address.city,
                      start_date: Faker::Date.between(2.days.ago, Date.today),
                      end_date: Faker::Date.between(2.days.ago, Date.today),
                      distance: Faker::Number.decimal(2),
                      bike_id: bike.id,
                      user_id: user.id
                    )
end

1000.times do
  Slot.first_or_create(
      station_id: Station.order("RANDOM()").first.id,
      available: Faker::Boolean.boolean(0.2),
      bike_id: Bike.order("RANDOM()").first.id
    )
end