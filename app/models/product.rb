class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  validates_presence_of :name, :vendor_id
  validates_numericality_of :vendor_id
end
