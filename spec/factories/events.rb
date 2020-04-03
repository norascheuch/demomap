FactoryBot.define do
  factory :event do
    description { Faker::Movies::StarWars.character }
    demo
    event_type
    user
    location { demo.start_location }
  end
end
