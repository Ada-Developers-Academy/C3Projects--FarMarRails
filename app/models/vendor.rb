class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def self.current_month
    Time.now.month
  end

  def current_month_sales
    sales.where(:purchase_time => Time.now.beginning_of_month..Time.now.end_of_month)
  end

  def archive
    update(archived: true)
  end
end
