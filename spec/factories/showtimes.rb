FactoryBot.define do
  factory :showtime do
    date_time { "2021-05-17 18:17:13" }
    tickets_available { 1 }
    cost { 1.5 }
    movie { nil }
  end
end