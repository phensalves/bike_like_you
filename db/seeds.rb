# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1000.times do
  user            = User.create(
                      email: Faker::Internet.safe_email,
                      name: Faker::Simpsons.character,
                      password: "1!2@3#",
                      password_confirmation: "1!2@3#"
                    )

  station         = Station.create(
                      name: Faker::Address.city
                    )

end

953.times do
  bike            = Bike.create(
                      brand: Faker::DrWho.character,
                      model: Faker::DrWho.specie,
                      station_id: Station.order("RANDOM()").first.id,
                      broked: false
                    )
  
  trip            =  Trip.create(
                      origin_station: Station.order("RANDOM()").first.name,
                      final_station: Station.order("RANDOM()").first.name,
                      start_date: Faker::Date.between(2.days.ago, Date.today),
                      end_date: Faker::Date.between(2.days.ago, Date.today),
                      distance: Faker::Number.decimal(2),
                      bike_id: bike.id,
                      user_id: User.order("RANDOM()").first.id
                    )
  trip.complete!
end

47.times do
  bike            = Bike.create(
                      brand: Faker::DrWho.character,
                      model: Faker::DrWho.specie,
                      station_id: Station.order("RANDOM()").first.id,
                      broked: true
                    )
end

5000.times do
  Slot.where(
      station_id: Station.order("RANDOM()").first.id,
      available: false,
      bike_id: Bike.order("RANDOM()").first.id
    ).first_or_create
end

5000.times do
  Slot.where(
      station_id: Station.order("RANDOM()").first.id,
      available: true,
      bike_id: nil
    ).first_or_create
end