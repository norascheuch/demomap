# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts'deleting old events'

Event.destroy_all

puts'starting seeds'

10.times do

user = User.create!({
    email: Faker::Internet.email(domain: 'gmail'),
    password: Faker::Internet.password(min_length: 10, max_length: 20),

  })

end

Demo.create!(description:'Lorem Ipsum  ', name:'Monday for future', user_id:1)

EventType.create!(name: 'sit-in')

Event.create!(description: 'Super important', location:'Friedrichstraße 2 Berlin', demo_id: 1, event_type_id: 1, user_id:1)

puts'finished'
