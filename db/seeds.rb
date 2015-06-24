require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# CSV.foreach("seed_csvs/all_market_data.csv", headers: true, header_converters: :symbol, converters: :all) do |row|
#
#
# end

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

CSV.foreach("seed_csvs/vendors.csv") do |row|
  Vendor.create(
    id: row[0],
    name: row[1],
    no_of_employees: row[2],
    market_id: row[3]
  )
end

CSV.foreach("seed_csvs/products.csv") do |row|
  Product.create(
    id: row[0],
    name: row[1],
    vendor_id: row[2]
  )
end

CSV.foreach("seed_csvs/sales.csv") do |row|
  Sale.create(
    id: row[0],
    amount: row[1],
    purchase_time: row[2],
    vendor_id: row[3],
    product_id: row[4]
  )
end
