#here I need to create seed data

#Create 3 users

nia = User.create(name: "Nia", username: "DoodleBoop", password: "abc123")
victoria = User.create(name: "Victoria", username: "GreenBean117", password: "beangreen")
shanice = User.create(name: "Shanice", username: "CarotChop", password: "password")
nicole = User.create(name: "Nicole", username: "BubbleTeaQueen413", password: "abc413")
lynn = User.create(name: "Lynn", username: "CakeDrop", password: "tippie")

#Create some places

Place.create(city_name: "Barcelona", user_id: nia.id)

#Use AR to pre-associate data:

nicole.places.create(city_name: "Kyoto")
shanices_place = shanice.places.build(city_name: "Oranjestad")
shanices_place.save