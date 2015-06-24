require 'csv'

seedmarkets = CSV.read('./seed_csvs/markets.csv', :headers => false)
markets = Market.all
counter = 0

markets.each do |market|

  if seedmarkets[counter][1] == market.name
    puts "#{market.id}"
    counter += 1
  else
    puts "#{market.id} smells off"
    break
  end

end

# counter = 1
#
# markets = Market.all
#
#
# does Markets[counter] == Csv[1]
#
#  counter = 1
#
# Market.all.each do |market|
#   if market.id == counter
#     counter += 1
#     puts "#{market.id}"
#   else
#     puts "wrong"
#     break
#   end
# end
