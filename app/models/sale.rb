class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor

  def self.total_amount(vendor)
    total = 0
    vendor.sales.each do |sale|
      total += sale.amount
    end
    return total
  end

  def self.start
    Time.new(Time.now.month)
  end

  def self.end_of_month
    Time.new(Time.now.month + 1)
  end
end
