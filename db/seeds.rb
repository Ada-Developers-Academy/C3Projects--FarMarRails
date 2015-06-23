# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

headers = [ :id, :name, :address, :city, :county, :state, :zip ]

CSV.foreach("seed_csvs/markets.csv", encoding: "UTF-8", write_headers: true, headers: headers ) do |row|
  Market.create(row.to_hash)
end
