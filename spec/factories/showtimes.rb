FactoryBot.define do
  factory :showtime do
    date_time { "14/06/2021 12:00".to_datetime }
    tickets_available { 1 }
    cost { 10.50 }
    movie
  end
end
