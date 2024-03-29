# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# 2 example demos
# both have routes, sensible events etc.
# both have comments and votes of around 25

require 'faker'

puts'Deleting old events, demo and eventtypes and comments and users'

Comment.destroy_all
Event.destroy_all
Demo.destroy_all
EventType.destroy_all
User.destroy_all

puts'starting seeds'


# neccessary event types. always create event types!

start_eventtype = EventType.create!(name: 'Start', icon: 'start-icon.svg')
end_eventtype = EventType.create!(name: 'End', icon: 'end-icon.svg')
event_type1 = EventType.create!(name: 'Sit In', icon: 'sit-in.svg')
event_type2 = EventType.create!(name: 'Speech', icon: 'announcement.svg')
event_type3 = EventType.create!(name: 'Concert', icon: 'concert.svg')
event_type4 = EventType.create!(name: 'Roadblock', icon: 'blockade-road.svg')
event_type5 = EventType.create!(name: 'First-Aid', icon: 'first-aid.svg')
event_type6 = EventType.create!(name: 'Danger', icon: 'police-danger.svg')



# using one user for all demos

user = User.create!({
    email: Faker::Internet.email(domain: 'gmail'),
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    organizer: true
  })



date = Date.today + 3 # setting the seeds start date

demo = Demo.create!(description:'This is an example demonstrations that shows you what this app can do. As an anonymous user look at the map and check out the marker that have been placed: the organizers let you know where announcements happen, where paramedics are located, where dangerous situations lurk and if there are other political events you might want to participate in. If you create an account you can write comments to the demonstration or events/markers on the map. Let other people know if an announcement is starting late or if you saw police blocking the street somewhere! Upvote comments so that your fellow demonstrators see the important information first. If you organize a demo or have been given admin rights you can create new markers and events on the map. In an admin interface you will see who else you are working during this demonstration to keep all the protesters informed. #FridaysForFuture is a movement that began in August 2018, after 15 years old Greta Thunberg sat in front of the Swedish parliament every schoolday for three weeks, to protest against the lack of action on the climate crisis. She posted what she was doing on Instagram and Twitter and it soon went viral.
  On the 8th of September, Greta decided to continue striking every Friday until the Swedish policies provided a safe pathway well under 2-degree C, i.e. in line with the Paris agreement.
  The hashtags #FridaysForFuture and #Climatestrike spread and many students and adults began to protest outside of their parliaments and local city halls all over the world. This has also inspired the Belgium Thursday school strikes.', name:'Example Fridays for future', user: user, start_time: Time.new(date.year,date.month,date.day,'14'), start_location:'U Eberswalder Strasse, Berlin',
  end_location: 'Brandenburger Tor Berlin', end_time: Time.new(date.year,date.month,date.day,'23'), route: "52.541264,13.412187;52.53826448831151,13.396140756758996;52.524986447507814,13.392912909617337;52.52389904688613,13.387640537880742;52.51691082159789,13.389048442865459;52.516148,13.376638")

event2 = Event.create!(description: 'Greta Thunberg is speaking on climate change', latitude: 52.5242187, longitude: 13.3874519, location:'Friedrichstadtpalast Berlin', demo: demo, event_type: event_type2, user: user)
event1 = Event.create!(description: "Peaceful resistance - let's block the cars!", latitude: 52.5174493, longitude: 13.3877424, location:'Unter den Linden 28, 10117 Berlin', demo: demo, event_type: event_type1, user: user)

Event.create!(description: 'Arrests by the police! Beware, violent situation going on.', latitude: 52.5371204, longitude: 13.394585321606, location:'Factory Berlin', demo: demo, event_type: event_type6, user: user)
Event.create!(description: 'Three cars from the police, cannot pass', latitude: 52.5179061, longitude: 13.3878263, location:'Mittelstraße 51-52, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
event6 = Event.create!(description: 'The Activists are playing live', latitude: 52.5410276, longitude: 13.4074865, location:'Eberswalder Str. 10, 10437 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: 'Come see the dancing squirrels', latitude: 52.5385981, longitude: 13.3963665, location:'Brunnenstraße 53, 13355 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: 'Three doctors in medics tent', latitude: 52.5287759, longitude: 13.3973901, location:'Linienstraße 94, 10115 Berlin', demo: demo, event_type: event_type5, user: user)
Event.create!(description: 'Four police cars have blocked passage', latitude: 52.5158768, longitude: 13.3886042, location:'Friedrichstraße 158, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
Event.create!(description: 'Organizers speak', location:'Unter den Linden 74, 10117 Berlin', latitude: 52.5168416, longitude: 13.3816742, demo: demo, event_type: event_type2, user: user)




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


# votes

25.times do
  user = User.create!({
    email: Faker::Internet.email(domain: 'gmail'),
    password: Faker::Internet.password(min_length: 10, max_length: 20)

  })

  z = rand(1..3)
  vote = 'up' if [1, 2].include?(z)

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

date = Date.today + 7 # setting the seeds start date

demo = Demo.create!(description:'Join XR Kreuzberg on our monthly go-slow ride. We’re raising awareness of air pollution by taking over the roads of Kreuzberg with bikes, music and banners. You’re welcome if you’re on two wheels – whether that’s a bike, rollerblades, a wheelchair or a penny farthing! We’ll take it very (very!) easy – but please make sure you and your wheels are safe on the road. Meet in Kreuzberg’s Markthalle Neun from 2.30, to set off at 3.00. The ride takes around an hour and we’ll finish with a bit of social time. Bring friends, kids, partners, flags, whistles and bells! ', name:"Clean Air Kreuzberg Bike Ride",
  user: user, start_time: (Date.today + 12), start_location:"Skalitzer Straße 137, Berlin, 10999",
    start_time: Time.new(date.year,date.month,date.day,'12'), end_location: "Hermannplatz, Berlin, 10967", end_time: Time.new(date.year,date.month,date.day,'23'), route: "52.49966,13.418248;52.49343190085773,13.402997036894163;52.498028112227985,13.389072644057165;52.51875616080102,13.428497129799325;52.509363379591605,13.37212850337616;52.49424904021416,13.361056094614383;52.48495318401959,13.385885132444429;52.486561,13.424468")

event2 = Event.create!(description: "Speech from Lana", latitude: 52.4977596, longitude: 13.3906496, location:'Berlin, Hallesches Tor', demo: demo, event_type: event_type2, user: user)
event1 = Event.create!(description: "Remember to cork!!", latitude: 52.52064425, longitude: 13.4230157005467, location:'Berlin Kino International', demo: demo, event_type: event_type6, user: user)
# Event.create!(description: '3 cars from the police, can not pass', location:'Unter den Linden 1, 10117 Berlin', demo: demo, event_type: event_type4, user: user)
# Event.create!(description: 'The Activists are playing live', location:'Unter den Linden 4, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
# Event.create!(description: 'Come see the dancing squirrels', location:'Unter den Linden 17, 10117 Berlin', demo: demo, event_type: event_type3, user: user)
Event.create!(description: '3 doctors in medics tent ', latitude: 52.5092044, longitude: 13.3759366, location: "Berlin Potsdamer Platz", demo: demo, event_type: event_type5, user: user)
Event.create!(description: '2 medics', latitude: 52.48409945, longitude: 13.3869655409355, location: "Platz der Luftbrücke, Berlin", demo: demo, event_type: event_type5, user: user)

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


for i in 1..25 do
  user = User.find(i)

  z = rand(1..3)
  vote = 'up' if [1, 2].include?(z)

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
