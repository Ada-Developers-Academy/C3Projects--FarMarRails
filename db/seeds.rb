# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("db/../seed_csvs/markets.csv") do |row|

  Market.create(
    name: row[1],
    address: row[2],
    city: row[3],
    state: row[4],
    county: row[5],
    zip: row[6]
    )

end

CSV.foreach("db/../seed_csvs/products.csv") do |row|

  Product.create(
    name: row[1],
    vendor_id: row[2]
    )

end

CSV.foreach("db/../seed_csvs/vendors.csv") do |row|

  Vendor.create(
    name: row[1],
    num_of_employees: row[2],
    market_id: row[3]
    )
end

CSV.foreach("db/../seed_csvs/sales.csv") do |row|

  Sale.create(
    amount: row[1],
    purchase_time: row[2],
    vendor_id: row[3],
    product_id: row[4]
    )

end



















