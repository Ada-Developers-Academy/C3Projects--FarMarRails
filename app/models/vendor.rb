class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales
  has_many :products

  def self.total_sales(vendor)
    total_sales = 0
    vendor.sales.each do |sale|
      total_sales += sale.amount
    end
    total_sales
  end

  def self.search(search)
    where("name like ?", "%#{search}%")
  end

end
