# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts'Deleting old events, demo and eventtypes and comments and users'

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

date = Date.today # setting the seeds start date

demo = Demo.create!(description:'#FridaysForFuture is a movement that began in August 2018, after 15 years old Greta Thunberg sat in front of the Swedish parliament every schoolday for three weeks, to protest against the lack of action on the climate crisis. She posted what she was doing on Instagram and Twitter and it soon went viral.
  On the 8th of September, Greta decided to continue striking every Friday until the Swedish policies provided a safe pathway well under 2-degree C, i.e. in line with the Paris agreement.
  The hashtags #FridaysForFuture and #Climatestrike spread and many students and adults began to protest outside of their parliaments and local city halls all over the world. This has also inspired the Belgium Thursday school strikes.', name:'Fridays for future', user: user, start_time: Time.new(date.year,date.month,date.day,'14'), start_location:'U Eberswalder Strasse, Berlin', route: '13.412187,52.541264;13.396140756758996,52.53826448831151;13.392912909617337,52.524986447507814;13.387640537880742,52.52389904688613;13.389048442865459,52.51691082159789;13.376638,52.516148', end_location: 'Brandenburger Tor Berlin')

event_typeS = EventType.create!(name: 'Start', icon: 'start-icon.svg')
event_typeE = EventType.create!(name: 'End', icon: 'end-icon.svg')

event_type1 = EventType.create!(name: 'Sit In', icon: 'sit-in.svg')
event_type2 = EventType.create!(name: 'Speech', icon: 'announcement.svg')
event_type3 = EventType.create!(name: 'Concert', icon: 'concert.svg')
event_type4 = EventType.create!(name: 'Roadblock', icon: 'blockade-road.svg')
event_type5 = EventType.create!(name: 'First-Aid', icon: 'first-aid.svg')
event_type6 = EventType.create!(name: 'Danger', icon: 'police-danger.svg')


# events and comments for demo


event2 = Event.create!(description: 'Greta Thunberg is speaking on climate change', location:'Friedrichstadtpalast Berlin', demo: demo, event_type: event_type2, user: user)


Event.create!(description: 'Arrests by the police! Beware, violent situation going on.', location:'Factory Berlin', demo: demo, event_type: event_type6, user: user)
Event.create!(description: 'Three cars from the police, cannot pass', location:'Mittelstraße 51-52, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
event6 = Event.create!(description: 'The Activists are playing live', location:'Eberswalder Str. 10, 10437 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: 'Come see the dancing squirrels', location:'Brunnenstraße 53, 13355 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: 'Three doctors in medics tent', location:'Linienstraße 94, 10115 Berlin', demo: demo, event_type: event_type5, user: user)
Event.create!(description: 'Four police cars have blocked passage', location:'Friedrichstraße 158, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
Event.create!(description: 'Organizers speak', location:'Unter den Linden 74, 10117 Berlin', demo: demo, event_type: event_type2, user: user)

event1 = Event.create!(description: "Peaceful resistance - let's block the cars!", location:'Unter den Linden 28, 10117 Berlin', demo: demo, event_type: event_type1, user: user)

c1 = Comment.create!(user: user, content: 'Environment is so important! I invited all my friends.', commentable: demo)
c2 = Comment.create!(user: user, content: "Great demonstration! I'm so happy we are so many and really make an impact!", commentable: demo)
c3 = Comment.create!(user: user, content: 'Not so sure about this. What about the businesses? We need planes and cars to keep the economy running.', commentable: demo)
c4 = Comment.create!(user: user, content: 'Ban diesel cars from cities now!!', commentable: demo)

c5 = Comment.create!(user: user, content: 'We need a lot of people fast! Move here now!', commentable: event1)
c6 = Comment.create!(user: user, content: "There's lots of police here but I think we can make it", commentable: event1)
c7 = Comment.create!(user: user, content: 'Lets do this!', commentable: event1)

c8 = Comment.create!(user: user, content: 'Nice speech, loved it!', commentable: event2)
c9 = Comment.create!(user: user, content: "Can someone please make the speaker louder? I can't hear anything!", commentable: event2)
c10 = Comment.create!(user: user, content: "Turn on the music agian please!", commentable: event2)
c11 = Comment.create!(user: user, content: "You should listen to what he is saying.", commentable: event2)

c12 = Comment.create!(user: user, content: 'Starts a bit later!', commentable: event6)

Event.create!(description: 'Startpoint of the demonstration', location: demo.start_location, demo: demo, event_type: event_typeS, user: user)
Event.create!(description: 'Endpoint of the demonstration', location: demo.end_location, demo: demo, event_type: event_typeE, user: user)

80.times do
  user = User.create!({
    email: Faker::Internet.email(domain: 'gmail'),
    password: Faker::Internet.password(min_length: 10, max_length: 20)

  })

  z = rand(1..3)
  if z == 1
    vote = 'down'
  else
    vote = 'up'
  end

  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].sample(7).each do |entry|
    case entry
    when 1 then c1.vote_by :voter => user, :vote => vote
    when 2 then c2.vote_by :voter => user, :vote => vote
    when 3 then c3.vote_by :voter => user, :vote => vote
    when 4 then c4.vote_by :voter => user, :vote => vote
    when 5 then c5.vote_by :voter => user, :vote => vote
    when 6 then c6.vote_by :voter => user, :vote => vote
    when 7 then c7.vote_by :voter => user, :vote => vote
    when 8 then c8.vote_by :voter => user, :vote => vote
    when 9 then c9.vote_by :voter => user, :vote => vote
    when 10 then c10.vote_by :voter => user, :vote => vote
    when 11 then c11.vote_by :voter => user, :vote => vote
    when 12 then c12.vote_by :voter => user, :vote => vote
    end
  end
end



# seeds for demo 2

date = Date.today + 3# setting the seeds start date

demo = Demo.create!(description:'Join XR Kreuzberg on our monthly go-slow ride. We’re raising awareness of air pollution by taking over the roads of Kreuzberg with bikes, music and banners. You’re welcome if you’re on two wheels – whether that’s a bike, rollerblades, a wheelchair or a penny farthing! We’ll take it very (very!) easy – but please make sure you and your wheels are safe on the road. Meet in Kreuzberg’s Markthalle Neun from 2.30, to set off at 3.00. The ride takes around an hour and we’ll finish with a bit of social time. Bring friends, kids, partners, flags, whistles and bells! ', name:"Clean Air Kreuzberg Bike Ride", user: user, start_time: (Date.today + 12), start_location:'Eisenbahnstraße 42, 10997 Berlin', route: "13.441892,52.500824;13.418358574701188,52.49902285715385;13.430275392487829,52.48589955365003;13.45901810872391,52.49287285931126;13.448379607994497,52.47777472885218;13.433042591527936,52.48159299866401;13.385927,52.485275")

event2 = Event.create!(description: 'Speech from Vanessa', location:'Unter den Linden Berlin', demo: demo, event_type: event_type2, user: user)
event4 = Event.create!(description: 'Block the Street', location:'Alexanderplatz Berlin', demo: demo, event_type: event_type1, user: user)
event1 = Event.create!(description: 'Serious situation beware', location:'Karl-Liebknecht-Str. 1, 10178 Berlin', demo: demo, event_type: event_type6, user: user)
# Event.create!(description: '3 cars from the police, can not pass', location:'Unter den Linden 1, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
# Event.create!(description: 'The Activists are playing live', location:'Unter den Linden 4, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
# Event.create!(description: 'Come see the dancing squirrels', location:'Unter den Linden 17, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
# Event.create!(description: '3 doctors in medics tent ', location:'Friedrichstraße 67, 10117 Berlin', demo: demo, event_type: event_type5, user: user)

c1 = Comment.create!(user: user, content: 'Environment is so important! I invited all my friends.', commentable: demo)
c2 = Comment.create!(user: user, content: "Great demonstration! I'm so happy we are so many and really make an impact!", commentable: demo)
c3 = Comment.create!(user: user, content: 'Not so sure about this. What about the businesses? We need planes and cars to keep the economy running.', commentable: demo)
c4 = Comment.create!(user: user, content: 'Ban diesel cars from cities now!!', commentable: demo)

c5 = Comment.create!(user: user, content: 'We need a lot of people fast! Move here now!', commentable: event1)
c6 = Comment.create!(user: user, content: "There's lots of police here but I think we can make it", commentable: event1)
c7 = Comment.create!(user: user, content: 'Lets do this!', commentable: event1)

c8 = Comment.create!(user: user, content: 'Nice speech, love it!', commentable: event2)
c9 = Comment.create!(user: user, content: "Can someone please make the speaker louder? I can't hear anything!", commentable: event2)
c10 = Comment.create!(user: user, content: "Turn on the music agian please!", commentable: event2)
c11 = Comment.create!(user: user, content: "You should listen to what he is saying.", commentable: event2)


for i in 1..80 do
  user = User.find(i)

  z = rand(1..3)
  if z == 1
    vote = 'down'
  else
    vote = 'up'
  end

  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].sample(7).each do |entry|
    case entry
    when 1 then c1.vote_by :voter => user, :vote => vote
    when 2 then c2.vote_by :voter => user, :vote => vote
    when 3 then c3.vote_by :voter => user, :vote => vote
    when 4 then c4.vote_by :voter => user, :vote => vote
    when 5 then c5.vote_by :voter => user, :vote => vote
    when 6 then c6.vote_by :voter => user, :vote => vote
    when 7 then c7.vote_by :voter => user, :vote => vote
    when 8 then c8.vote_by :voter => user, :vote => vote
    when 9 then c9.vote_by :voter => user, :vote => vote
    when 10 then c10.vote_by :voter => user, :vote => vote
    when 11 then c11.vote_by :voter => user, :vote => vote
    end
  end
end

# date = Date.today + 4# setting the seeds start date
# demo3 = Demo.create!(description:'We invite all rebels to connect daily with a tree, rooting our resilience and strengthening our nervous systems as we lead up to the rebellion in May.
# Nature connection has been proven to help our mental health and reduce stress and anxiety and build our resilience.
# As well as fostering greater rebel resilience and mental health, through creating and nurturing connection with these beings with whom we are so interdependent, we may well find that this action will be helping us, and them, survive the changes that lie ahead.  ', name:'Rooting Rebel Resilience', user: user, start_time: Time.new(date.year,date.month,date.day,'14'), start_location:'Oranienstraße 185, 10999 Berlin', route: '13.413930095294177,52.52162393940594;13.410865,52.522989,13.397043,52.517562;13.388856,52.517209;13.391318,52.501354')

# date = Date.today + 7# setting the seeds start date
# demo4 = Demo.create!(description:'#FridaysForFuture is a movement that began in August 2018, after 15 years old Greta Thunberg sat in front of the Swedish parliament every schoolday for three weeks, to protest against the lack of action on the climate crisis. She posted what she was doing on Instagram and Twitter and it soon went viral.
# On the 8th of September, Greta decided to continue striking every Friday until the Swedish policies provided a safe pathway well under 2-degree C, i.e. in line with the Paris agreement.
# The hashtags #FridaysForFuture and #Climatestrike spread and many students and adults began to protest outside of their parliaments and local city halls all over the world. This has also inspired the Belgium Thursday school strikes.  ', name:'Fridays for future', user: user, start_time: Time.new(date.year,date.month,date.day,'18'), start_location:'Alexanderplatz, Berlin')

# date = Date.today + 9# setting the seeds start date
# demo5 = Demo.create!(description:'Mothers & Babies of XR, with support of Grandparents and other family members, will stage a mass Feed-In at the Department for Business, Energy & Industry Strategy to demand the END of Fossil Fuel Madness.
# Despite signing the 2015 Paris Agreement, and despite the UK Government declaring a Climate Emergency in April 2019, UK carbon emissions continue to increase. The true figures of carbon emissions include imports, shipping, aviation, deforestation, and destruction of peat lands. Plans are underway for the new Drax Gas Power Station, Bradley open face coal mine expansion, HS2, and Teeside Valley Airport Expansion. ', name:'End Fossil Fuel Madness', user: user, start_time: Time.new(date.year,date.month,date.day,'14'), start_location:'Gendarmenmarkt, 10117 Berlin')

# date = Date.today + 12# setting the seeds start date
# demo6 = Demo.create!(description:'Extinction Rebellion are taking to the streets in support and solidarity with women’s movements around the world. Extinction Rebellion is a global movement and we stand side by side with our sisters all around the world, many of whom don’t have the same freedom of speech and expression we have. We would like to invite every part of every one to join us today to stand in solidarity with women and women’s rights movements all around the world. We are all crew!', name:'International Women’s Day – all genders', user: user, start_time: Time.new(date.year,date.month,date.day,'10'), start_location:'Auguststraße 24, 10117 Berlin')


puts'finished'
