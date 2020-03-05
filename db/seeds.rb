# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts'Deleting old events, demo and eventtypes and comments'

Comment.destroy_all

Event.destroy_all

Demo.destroy_all

EventType.destroy_all

User.destroy_all

puts'starting seeds'


user = User.create!({
    email: Faker::Internet.email(domain: 'gmail'),
    password: Faker::Internet.password(min_length: 10, max_length: 20),

  })

user2 = User.create!({
    email: Faker::Internet.email(domain: 'gmail'),
    password: Faker::Internet.password(min_length: 10, max_length: 20),

  })



demo = Demo.create!(description:'Lorem Ipsum  ', name:'Mondays for future', user: user, start_time: Date.today)
demo2 = Demo.create!(description:'Lorem Ipsum  ', name:"You can't eat money!", user: user, start_time: (Date.today + 12))
demo3 = Demo.create!(description:'Lorem Ipsum  ', name:'Critical Mass', user: user, start_time: (Date.today + 1))
demo4 = Demo.create!(description:'Lorem Ipsum  ', name:'Mondays for future', user: user, start_time: (Date.today + 5))
demo5 = Demo.create!(description:'Lorem Ipsum  ', name:'Female Future', user: user, start_time: (Date.today + 5))

event_type1 = EventType.create!(name: 'sit-in', icon: 'sit-in.svg')
event_type2 = EventType.create!(name: 'speech', icon: 'share.svg')
event_type3 = EventType.create!(name: 'police', icon: 'group.svg')

event1 = Event.create!(description: 'Sit In!', location:'Checkpoint Charlie Berlin', demo: demo, event_type: event_type1, user: user)
event2 = Event.create!(description: 'Speech from Martin', location:'Friedrichstraße 4 Berlin', demo: demo, event_type: event_type2, user: user)
event3 = Event.create!(description: 'Speech from Vanessa', location:'Unter den Linden Berlin', demo: demo, event_type: event_type2, user: user)
event4 = Event.create!(description: 'Speech from Cole', location:'Alexanderplatz Berlin', demo: demo, event_type: event_type2, user: user)


Event.create!(description: '6 pack', location:'Rathausstraße 25, 10178 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '6 pack', location:'Unter den Linden 1, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '6 pack', location:'Scharrenstraße 22, 10178 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '6 pack', location:'Werderscher Markt 1, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '12 pack', location:'Mohrenstraße 30, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '24 pack', location:'Checkpoint Charlie Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '24 pack', location:'Checkpoint Charlie Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '24 pack', location:'Checkpoint Charlie Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '24 pack', location:'Checkpoint Charlie Berlin', demo: demo, event_type: event_type3, user: user)



Comment.create!(user: user, content: 'We need a lot of people fast! Move here now!', commentable: event1)
Comment.create!(user: user, content: "There's lots of police here but I think we can make it", commentable: event1)
Comment.create!(user: user, content: 'Lets do this!', commentable: event1)
c1 = Comment.create!(user: user, content: 'Environment is so important! I invited all my friends.', commentable: demo)
c2 = Comment.create!(user: user, content: "Great demonstration! I'm so happy we are so many and really make an impact!", commentable: demo)
c3 = Comment.create!(user: user, content: 'Not so sure about this. What about the businesses? We need planes and cars to keep the economy running.', commentable: demo)


c1.vote_by :voter => user, :vote => 'up'
c3.vote_by :voter => user, :vote => 'down'
c2.vote_by :voter => user, :vote => 'up'
c1.vote_by :voter => user2, :vote => 'up'
c3.vote_by :voter => user2, :vote => 'down'
c2.vote_by :voter => user2, :vote => 'down'


puts'finished'
