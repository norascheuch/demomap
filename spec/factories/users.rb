FactoryBot.define do
  factory :user do
    email { Faker::Internet.email(domain: 'gmail') }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }
  end
end
