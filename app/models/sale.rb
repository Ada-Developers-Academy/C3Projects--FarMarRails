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

end
