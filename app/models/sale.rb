class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  def self.sales_by_month(sales)
    sales_array = []
    sales.each do |sale|
      if sale.purchase_time.month == Time.now.month
        sales_array.push(sale)
      end
    end
    sales_array
  end

end
