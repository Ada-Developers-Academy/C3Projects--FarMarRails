require 'csv'

markets_csv = File.read(Rails.root.join('seed_csvs', 'markets.csv'))
markets = CSV.parse(markets_csv, :headers => false)
markets.each do |row|
  t = Market.new
  t.id = row[0].to_i
  t.name = row[1]
  t.address = row[2]
  t.city = row[3]
  t.county = row[4]
  t.state = row[5]
  t.zip = row[6]

  t.save
end

vendors_csv = File.read(Rails.root.join('seed_csvs', 'vendors.csv'))
vendors = CSV.parse(vendors_csv, :headers => false)
vendors.each do |row|
  t = Vendor.new
  t.id = row[0].to_i
  t.name = row[1]
  t.num_employees = row[2].to_i
  t.market_id = row[3].to_i

  t.save
end

products_csv = File.read(Rails.root.join('seed_csvs', 'products.csv'))
products = CSV.parse(products_csv, :headers => false)
products.each do |row|
  t = Product.new
  t.id = row[0].to_i
  t.name = row[1]
  t.vendor_id = row[2].to_i

  t.save
end

sales_csv = File.read(Rails.root.join('seed_csvs', 'sales.csv'))
sales = CSV.parse(sales_csv, :headers => false)
sales.each do |row|
  t = Sale.new
  t.id = row[0].to_i
  t.amount = row[1].to_i
  t.purchase_time = DateTime.strptime(row[2], format='%Y-%m-%d %H:%M:%S %Z').to_datetime
  t.vendor_id = row[3].to_i
  t.product_id = row[4].to_i

  t.save
end
