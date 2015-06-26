class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product
  validate :monetary_value

  def self.sales_by_month(sales)
    sales_array = []
    sales.each do |sale|
      if sale.purchase_time.month == Time.now.month
        sales_array.push(sale)
      end
    end
    sales_array
  end

  def monetary_value
    nums = amount.to_s.split(//)
    if nums.count(".") > 1
      error[:not_money] << "INVALID INPUT"
    end
    nums.each do |num|
      unless ("0".."9").include?(num) || num == "."
        return error[:not_money] << "INVALID INPUT"
      end
    end
  end

end
