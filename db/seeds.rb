# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

headers = [:id, :name, :address, :city, :county, :state, :zip]

CSV.foreach("db/csv/markets.csv", { encoding: "UTF-8", write_headers: true, headers: headers, converters: :all}) do |row|
  Market.create(row.to_hash)
end

product_headers = [:id, :name, :vendor_id]

CSV.foreach("db/csv/products.csv", { encoding: "UTF-8", write_headers: true, headers: product_headers, converters: :all}) do |row|
  Product.create(row.to_hash)
end

vendor_headers = [:id, :name, :num_employees, :market_id]

CSV.foreach("db/csv/vendors.csv", { encoding: "UTF-8", write_headers: true, headers: vendor_headers, converters: :all}) do |row|
  Vendor.create(row.to_hash)
end

sale_headers = [:id, :amount, :purchase_time, :vendor_id, :product_id]

CSV.foreach("db/csv/sales.csv", { encoding: "UTF-8", write_headers: true, headers: sale_headers, converters: :all}) do |row|
  Sale.create(row.to_hash)
end
