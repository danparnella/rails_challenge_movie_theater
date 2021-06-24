FactoryBot.define do
  factory :customer do
    name { "Tony Stark" }
    email { "tony@stark.com" }

    trait :invalid_email do
      email { "asdasd.co" }
    end
  end
end
