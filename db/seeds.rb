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


demo = Demo.create!(description:'#FridaysForFuture is a movement that began in August 2018, after 15 years old Greta Thunberg sat in front of the Swedish parliament every schoolday for three weeks, to protest against the lack of action on the climate crisis. She posted what she was doing on Instagram and Twitter and it soon went viral.
  On the 8th of September, Greta decided to continue striking every Friday until the Swedish policies provided a safe pathway well under 2-degree C, i.e. in line with the Paris agreement.
  The hashtags #FridaysForFuture and #Climatestrike spread and many students and adults began to protest outside of their parliaments and local city halls all over the world. This has also inspired the Belgium Thursday school strikes.', name:'Fridays for future', user: user, start_time: Date.today, start_location:'Alexanderplatz, Berlin')

demo2 = Demo.create!(description:'Join XR Kreuzberg on our monthly go-slow ride. We’re raising awareness of air pollution by taking over the roads of Kreuzberg with bikes, music and banners. You’re welcome if you’re on two wheels – whether that’s a bike, rollerblades, a wheelchair or a penny farthing! We’ll take it very (very!) easy – but please make sure you and your wheels are safe on the road. Meet in Kreuzberg’s Markthalle Neun from 2.30, to set off at 3.00. The ride takes around an hour and we’ll finish with a bit of social time. Bring friends, kids, partners, flags, whistles and bells! ', name:"Clean Air Kreuzberg Bike Ride", user: user, start_time: (Date.today + 12), start_location:'Eisenbahnstraße 42, 10997 Berlin')

demo3 = Demo.create!(description:'We invite all rebels to connect daily with a tree, rooting our resilience and strengthening our nervous systems as we lead up to the rebellion in May.
Nature connection has been proven to help our mental health and reduce stress and anxiety and build our resilience.
As well as fostering greater rebel resilience and mental health, through creating and nurturing connection with these beings with whom we are so interdependent, we may well find that this action will be helping us, and them, survive the changes that lie ahead.  ', name:'Rooting Rebel Resilience', user: user, start_time: (Date.today + 1), start_location:'Oranienstraße 185, 10999 Berlin')

demo4 = Demo.create!(description:'#FridaysForFuture is a movement that began in August 2018, after 15 years old Greta Thunberg sat in front of the Swedish parliament every schoolday for three weeks, to protest against the lack of action on the climate crisis. She posted what she was doing on Instagram and Twitter and it soon went viral.
On the 8th of September, Greta decided to continue striking every Friday until the Swedish policies provided a safe pathway well under 2-degree C, i.e. in line with the Paris agreement.
The hashtags #FridaysForFuture and #Climatestrike spread and many students and adults began to protest outside of their parliaments and local city halls all over the world. This has also inspired the Belgium Thursday school strikes.  ', name:'Fridays for future', user: user, start_time: (Date.today + 7), start_location:'Alexanderplatz, Berlin')

demo5 = Demo.create!(description:'Mothers & Babies of XR, with support of Grandparents and other family members, will stage a mass Feed-In at the Department for Business, Energy & Industry Strategy to demand the END of Fossil Fuel Madness.
Despite signing the 2015 Paris Agreement, and despite the UK Government declaring a Climate Emergency in April 2019, UK carbon emissions continue to increase. The true figures of carbon emissions include imports, shipping, aviation, deforestation, and destruction of peat lands. Plans are underway for the new Drax Gas Power Station, Bradley open face coal mine expansion, HS2, and Teeside Valley Airport Expansion. ', name:'End Fossil Fuel Madness', user: user, start_time: (Date.today + 9), start_location:'Gendarmenmarkt, 10117 Berlin')

demo6 = Demo.create!(description:'Extinction Rebellion are taking to the streets in support and solidarity with women’s movements around the world. Extinction Rebellion is a global movement and we stand side by side with our sisters all around the world, many of whom don’t have the same freedom of speech and expression we have. We would like to invite every part of every one to join us today to stand in solidarity with women and women’s rights movements all around the world. We are all crew!', name:'International Women’s Day – all genders', user: user, start_time: (Date.today + 11), start_location:'Auguststraße 24, 10117 Berlin')

event_type1 = EventType.create!(name: 'sit-in', icon: 'sit-in.svg')
event_type2 = EventType.create!(name: 'speech', icon: 'group.svg')
event_type3 = EventType.create!(name: 'concert', icon: 'music.svg')
event_type4 = EventType.create!(name: 'road-block', icon: 'block.svg')
event_type5 = EventType.create!(name: 'first-aid', icon: 'first-aid.svg')
event_type6 = EventType.create!(name: 'danger', icon: 'exclamation.svg')



event2 = Event.create!(description: 'Speech from Martin', location:'Friedrichstraße 4 Berlin', demo: demo, event_type: event_type2, user: user)
event3 = Event.create!(description: 'Speech from Vanessa', location:'Unter den Linden Berlin', demo: demo, event_type: event_type2, user: user)
event4 = Event.create!(description: 'Speech from Cole', location:'Alexanderplatz Berlin', demo: demo, event_type: event_type2, user: user)


Event.create!(description: 'Serious situation beware', location:'Karl-Liebknecht-Str. 1, 10178 Berlin', demo: demo, event_type: event_type6, user: user)
Event.create!(description: '3 cars from the police, can not pass', location:'Unter den Linden 1, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
Event.create!(description: 'The Activists are playing live', location:'Unter den Linden 4, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: 'Come see the dancing squirrels', location:'Unter den Linden 17, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '3 doctors in medics tent ', location:'Friedrichstraße 67, 10117 Berlin', demo: demo, event_type: event_type5, user: user)
Event.create!(description: '1 doctor', location:'Friedrichstraße 47, 10117 Berlin', demo: demo, event_type: event_type5, user: user)
Event.create!(description: 'Block ', location:'Friedrichstraße 50, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
Event.create!(description: '24 pack- live with 2 pack', location:'Checkpoint Charlie Berlin', demo: demo, event_type: event_type3, user: user)
event1 = Event.create!(description: 'Sit In!', location:'Rudi-Dutschke-Straße 26, 10969 Berlin', demo: demo, event_type: event_type1, user: user)



Comment.create!(user: user, content: 'We need a lot of people fast! Move here now!', commentable: event1)
Comment.create!(user: user, content: "There's lots of police here but I think we can make it", commentable: event1)
Comment.create!(user: user, content: 'Lets do this!', commentable: event1)
c1 = Comment.create!(user: user, content: 'Environment is so important! I invited all my friends.', commentable: demo)
c2 = Comment.create!(user: user, content: "Great demonstration! I'm so happy we are so many and really make an impact!", commentable: demo)
c3 = Comment.create!(user: user, content: 'Not so sure about this. What about the businesses? We need planes and cars to keep the economy running.', commentable: demo)

# 100.times do
#   # u = create user
#   # c1.vote_by :voter => u, :vote => 'up'
# end

c1.vote_by :voter => user, :vote => 'up'
c3.vote_by :voter => user, :vote => 'down'
c2.vote_by :voter => user, :vote => 'up'
c1.vote_by :voter => user2, :vote => 'up'
c3.vote_by :voter => user2, :vote => 'down'
c2.vote_by :voter => user2, :vote => 'down'


puts'finished'
