FactoryBot.define do
  factory :demo do
    name { Faker::Lorem.words(number: 3).join(' ') }
    start_time { Time.now }
    end_time { Time.now + 10800 }
    association :user, factory: :user
    start_location { Faker::Address.full_address }
    end_location { Faker::Address.full_address }

    # after_create do |demo|
    #   demo.events << FactoryBot.create_list(:event, 2, description: ["End", "Start"])
    # end
  end
end
