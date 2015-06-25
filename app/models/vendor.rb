class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales
  has_many :products

  validates_presence_of :name, :number_of_employees, :market_id
  validates_numericality_of :number_of_employees, :market_id
end
