FactoryBot.define do
  factory :event_type do
    name { 'Start' }
    icon { 'icon' }
  end

  factory :demo do
    name { Faker::Lorem.words(number: 3) }
    start_time { Time.now }
    end_time { Time.now + 10800 }
    user_id { User.last.id }
    start_location { Faker::Address.full_address }
    end_location { Faker::Address.full_address }
  end
end
