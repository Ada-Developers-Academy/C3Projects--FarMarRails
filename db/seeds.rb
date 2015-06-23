# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

markets = CSV.read('./seed_csvs/markets.csv', :headers => false)

markets.each do |row|
  market = {}
  market[:name] = row[1]
  market[:address] = row[2]
  market[:city] = row[3]
  market[:county] = row[4]
  market[:state] = row[5]
  market[:zip] = row[6]

  Market.find_or_create_by(market)
end

vendors = CSV.read('./seed_csvs/vendors.csv', :headers => false)

vendors.each do |row|
  vendor = {}
  vendor[:name] = row[1]
  vendor[:no_of_employees] = row[2]
  vendor[:market_id] = row[3]

  Vendor.find_or_create_by(vendor)
end

products = CSV.read('./seed_csvs/products.csv', :headers => false)

products.each do |row|
  product = {}
  product[:name] = row[1]
  product[:vendor_id] = row[2]

  Product.find_or_create_by(product)
end

sales = CSV.read('./seed_csvs/sales.csv', :headers => false)

sales.each do |row|
  sale = {}
  sale[:amount] = row[1]
  sale[:purchase_time] = row[2]
  sale[:vendor_id] = row[3]
  sale[:product_id] = row[4]

  Sale.find_or_create_by(sale)
end
