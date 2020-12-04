print "Creating Users..."

User.destroy_all

User.create!(
  name: 'Sam',
  email: 'sam@sam.com',
  password_digest: 'chicken'
)

User.create!(
  name: 'Sean',
  email: 'sean@sean.com',
  password_digest: 'chicken'
)

puts "created #{User.count} users."


print "Creating Systems..."

System.destroy_all

System.create!(
  name: 'Alpha',
  planets: 4
)

puts "created #{System.count} users."


print "Creating Planets..."

Planet.destroy_all

Planet.create!(
  name: "Planet 1",
  size: 3,
  fuel_present: true,
  fuel_constructed: false,
  image: 'http://placekitten.com/300/300'
)

Planet.create!(
  name: "Planet 2",
  size: 2,
  fuel_present: false,
  fuel_constructed: true,
  image: 'http://placekitten.com/200/200'
)

Planet.create!(
  name: "Planet 3",
  size: 1,
  fuel_present: false,
  fuel_constructed: false,
  image: 'http://placekitten.com/100/100'
)

Planet.create!(
  name: "Planet 4",
  size: 2,
  fuel_present: false,
  fuel_constructed: false,
  image: 'http://placekitten.com/200/200'
)

puts "created #{Planet.count} planets."


print "Creating Ships..."

Ship.destroy_all

Ship.create!(
  name: 'MyShip!',
  fuel: 10
)

puts "created #{Ship.count} ships."
