class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  def self.format_input(amount_string)
    amount_string.delete("$").to_f * 100
  end
end
