class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def self.current_month
    Time.now.month
  end

  def current_month_sales
    sales.where("strftime('%m', purchase_time) + 0 = ?", Vendor.current_month)
  end
end
