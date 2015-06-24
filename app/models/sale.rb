class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  # def cents_to_dollars
  #   
  # end
end
