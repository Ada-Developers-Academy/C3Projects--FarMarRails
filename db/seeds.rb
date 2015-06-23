require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
CSV.foreach("seed_csvs/all_market_data.csv", headers: true, header_converters: :symbol, converters: :all) do |row|


end

CSV.foreach("seed_csvs/markets.csv") do |row|
  Market.create(
    id: row[0],
    name: row[1],
    street_address: row[2],
    city: row[3],
    county: row[4],
    state: row[5],
    zip: row[6]
  )
end
