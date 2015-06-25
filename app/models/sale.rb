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

  def self.total_current_month(vendor)
    total = 0
    sales_current_month = vendor.sales.where(purchase_time: Time.now.beginning_of_month..Time.now.end_of_month)
    sales_current_month.each do |sale|
      total += sale.amount
    end
    return total
  end
end
