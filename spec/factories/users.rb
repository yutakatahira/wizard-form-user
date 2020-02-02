FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password(6) }
    remember_token { Faker::String.random }
  end
end
