class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  def dollar_amount
    amount.to_f / 100
  end

  def date
    purchase_time.strftime("%B %-d, %Y")
  end

  def time
    purchase_time.strftime("%l:%M %P")
  end
end
