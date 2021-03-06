# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Setup airports
require 'csv'

csv = CSV.open('./db/data.csv').read

csv.each_with_index do |airport, index|
  Airport.create(city: airport[0], location: airport[1], code: airport[2]) if (index % 500).zero?
end

# Setup flights
airports = Airport.all
5_000.times do |time|
  puts time
  start = rand(1.day.ago..52.weeks.from_now).to_date
  duration = rand 1..259_200

  a = Flight.new(start_datetime: start, duration_interval: duration)

  a.departure_airport = airports.sample
  a.arrival_airport = airports.sample

  a.save
end
