class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  def self.format_input(amount_string)
    amount_string.delete("$").to_f * 100
  end

  def self.sum_amount(collection_of_sales)
    collection_of_sales.reduce(0){ |sum, sale| sum + sale.amount }
  end
end
