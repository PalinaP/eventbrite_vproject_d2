# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# creation of 10 users (belongs_to city)
User.destroy_all

10.times do
  User.create(
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    description:Faker::Alphanumeric.alpha(number: 30),
    email:Faker::Internet.email,
    encrypted_password:Faker::Alphanumeric.alpha(number: 10)
  )
end

puts "10 users have been created"

# creation of 15 events (belongs_to organizor)
Event.destroy_all
duration_array = []
n = 5
while n < 1440
  duration_array << n
  n = n + 5
end

15.times do
  Event.create(
    start_date:Faker::Date.forward(days: 365),
    duration:duration_array.sample,
    title:Faker::Book.title,
    description:Faker::Alphanumeric.alpha(number: 30),
    price:rand(1..1000),
    location:"Marseille",
    organizor_id: User.all.sample.id
  )
end

puts "15 events have been created"



# creation of 50 attendances
Attendance.destroy_all
50.times do
  Attendance.create(
    stripe_customer_id: Faker::Alphanumeric.alpha(number: 10),
    event_id: Event.all.sample.id,
    participant_id: User.all.sample.id
  )
end

puts "50 attendances have been created"
