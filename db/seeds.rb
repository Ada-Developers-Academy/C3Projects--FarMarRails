# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

# MARKETS
markets = CSV.read("seed_csvs/markets.csv", {headers: true, return_headers: true})

markets.each do |market_row|
  market = {}
  market[:name] = market_row[1]
  market[:address] = market_row[2]
  market[:city] = market_row[3]
  market[:county] = market_row[4]
  market[:state] = market_row[5]
  market[:zipcode] = market_row[6]

  Market.create(market)
end

# VENDORS
vendors = CSV.read("seed_csvs/vendors.csv", {headers: true, return_headers: true})

vendors.each do |vendor_row|
  vendor = {}
  vendor[:name] = vendor_row[1]
  vendor[:number_of_employees] = vendor_row[2]
  vendor[:market_id] = vendor_row[3]

  Vendor.create(vendor)
end

# PRODUCTS
products = CSV.read("seed_csvs/products.csv", {headers: true, return_headers: true})

products.each do |product_row|
  product = {}
  product[:name] = product_row[1]
  product[:vendor_id] = product_row[2]

  Product.create(product)
end

# SALES
sales = CSV.read("seed_csvs/sales.csv", {headers: true, return_headers: true})

sales.each do |sale_row|
  sale = {}
  sale[:amount] = sale_row[1]
  sale[:purchase_time] = sale_row[2]
  sale[:vendor_id] = sale_row[1]
  sale[:product_id] = sale_row[1]

  Sale.create(sale)
end
