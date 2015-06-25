class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  scope :current_month, -> {where(purchase_time: "purchase_time > Time.now.beginning_of_month")}

end
