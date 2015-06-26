class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates_presence_of :amount, :purchase_time, :vendor_id, :product_id
  validates_numericality_of :amount, :vendor_id, :product_id

  def amount_formatted
    Money.us_dollar(amount).format
  end

  def date
    purchase_time.strftime("%m/%d/%y")
  end

  def time
    purchase_time.strftime("%l:%M %P")
  end
end
