print "Creating Users..."

User.destroy_all

sam = User.create!(
  name: 'Sam',
  email: 'sam@sam.com',
  password: 'chicken',
  currency: 1000,
  fuel: 10,
  green_crystals: 0,
  red_crystals: 0,
  blue_crystals: 0,
  purple_crystals: 0
)

puts "created #{User.count} users."


print "Creating Systems..."

System.destroy_all

sys1 = System.create!(
  name: 'Alpha',
  image: 'http://placekitten.com/500/500',
  user_id: sam.id,
  time_entered: Time.now.getutc
)

puts "created #{System.count} users."


print "Creating Planets..."

Planet.destroy_all

Planet.create!(
  name: "Planet 1",
  size: 3,
  fuel_present: true,
  fuel_constructed: false,
  image: 'http://placekitten.com/300/300',
  system_id: sys1.id
)

Planet.create!(
  name: "Planet 2",
  size: 2,
  fuel_present: true,
  fuel_constructed: false,
  image: 'http://placekitten.com/200/200',
  system_id: sys1.id
)

Planet.create!(
  name: "Planet 3",
  size: 1,
  fuel_present: false,
  fuel_constructed: false,
  image: 'http://placekitten.com/100/100',
  system_id: sys1.id
)

Planet.create!(
  name: "Planet 4",
  size: 2,
  fuel_present: false,
  fuel_constructed: false,
  image: 'http://placekitten.com/200/200',
  system_id: sys1.id
)

puts "created #{Planet.count} planets."


print "Creating Ships..."

Ship.destroy_all

Ship.create!(
  name: 'MyShip!',
  fuel: 10,
  user_id: sam.id
)

puts "created #{Ship.count} ships."
