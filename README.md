# README

This project is a simple API that list stations and user trips, and also permit start and finish trips between different stations

To init, make sure that you have your own db user and password with names 'MY_POSTGRES_USER' and 'MY_POSTGRES_PASSWD', or maybe you want to change them by your own ENV variables names.

To start project run 'bundle install' to install all gems (make sure you have bundler installed in you environment).

Next run 'rake db:setup' to setup local db in your environment. The seeds.rb file will populate the db with fake data. Maybe gonna exists some trips with same station in origin and final, but, when we gonna to test our calls, the API does not permit to finish trip in the same origin station if both has same name.

To login user, use one random email and authentication_token from an user. You would can get him using rails console and pass through header with keys: 'X-User-Email' and 'X-User-Token'. If you don't send them, the API wont permit requests and will show a message.

To list user trips, call using GET method, the endpoint '/api/v1/users/my_trips' making sure that you are sending correct headers. The API will respond with a JSON object with the follow structure, for example:
```
[
    {
        "id": 589,
        "origin_station": "North Gradyborough",
        "final_station": "Lailaberg",
        "start_date": "25/03/2018 às 16:32",
        "end_date": "25/03/2018 às 15:37",
        "distance": 62.02,
        "bike": {
            "id": 589,
            "brand": "Sarah Jane Smith",
            "model": "Protohuman"
        }
    }
]
```
To list all stations, you can call 'api/v1/stations'. The API will respond with a JSON object as follow:
```
[
    {
        "station_name": "East Gerry",
        "available_slots": 1,
        "unavailable_slots": 1
    },
    {
        "station_name": "Port Archibald",
        "available_slots": 1,
        "unavailable_slots": 8
    },
    {
        "station_name": "West Krystalview",
        "available_slots": 1,
        "unavailable_slots": 8
    },
    {
        "station_name": "Murielstad",
        "available_slots": 1,
        "unavailable_slots": 8
    },
    {
        "station_name": "Hassiefurt",
        "available_slots": 1,
        "unavailable_slots": 11
    },
    {
        "station_name": "North Llewellyn",
        "available_slots": 1,
        "unavailable_slots": 4
    },
    {
        "station_name": "New Elvaburgh",
        "available_slots": 1,
        "unavailable_slots": 2
    },
    {
        "station_name": "Erastad",
        "available_slots": 1,
        "unavailable_slots": 6
    },
    {
        "station_name": "Elenaland",
        "available_slots": 1,
        "unavailable_slots": 8
    },
    {
        "station_name": "Port Hershelmouth",
        "available_slots": 1,
        "unavailable_slots": 4
    }
]
```
To start a trip, pass a bike_id and your credentials in header as explained above using POST method to '/api/v1/trips/start_trip'. For example: '/api/v1/trips/start_trip?bike_id=722'. If the bike would not broked, the response will be 201 and you will receive a message as:
```
{
    "sucess": true,
    "message": "Trip started!"
}
```
If it would be broked, you will receive a 422 code and message gonna be:
```
{
    "sucess": false,   
    "message": 'Can not start trip. Choose another bike.'
}
```
To finish a trip, make sure the end station is different from origin station, or the trip won't be finished and you will receive the message with a 422 code:
```
{
    "sucess": false,
    "message": 'You cannot finish your trip in this station. Please, choose another station.'
}
```
The project use state machine to make sure that trip start and finish correctly. Also use async job through application job to make calls to an external api when a trip is finished.

To populate test db, run 'RAILS_ENV=test rake db:setup'

To finish, go to root path from project and, to run all tests, just type 'rspec'.

Its important run redis-server, because the project uses application job with sidekiq, ok?

Thank you!
