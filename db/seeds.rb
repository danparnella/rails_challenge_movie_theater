# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.find_or_create_by!(name: "Star Wars")
Movie.find_or_create_by!(name: "Lord of the Rings")

date_times = [
  "14/10/2021 12:00",
  "14/10/2021 14:30",
  "14/10/2021 17:00",
  "15/10/2021 12:00",
  "15/10/2021 14:30",
  "15/10/2021 17:00"
]

Movie.all.each do |movie|
  date_times.each do |date_time|
    movie.showtimes.find_or_create_by!(date_time: date_time.to_datetime, tickets_available: 20, cost: 950)
  end
end

danny = Customer.find_or_create_by!(name: "Danny Parnella", email: "danny@launchpadlab.com")
danny.orders.find_or_create_by!(showtime: Showtime.first,
                                quantity: 5,
                                cc_number: CreditCardValidations::Factory.random(:visa),
                                cc_expiration: "12/2025".to_date,
                                cc_security_code: "123")
Showtime.first.update!(tickets_available: 19)

