FactoryBot.define do
  factory :event do
    description { Faker::StarWars.character }
    user_id { nil }
    demo_id { nil }
  end
end
