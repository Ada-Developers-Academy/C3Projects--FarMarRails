class Product < ActiveRecord::Base
  belongs_to :vendors
  has_many :sales
end
