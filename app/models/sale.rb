class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  scope :current_month, -> { where(purchase_time: Time.now.beginning_of_month..Time.now)}

  def self.current_month_total(sales)
    sales_total = 0
    sales.each do |sale|
      sales_total += sale.amount
    end
    sales_total
  end
end
