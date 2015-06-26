class Product < ActiveRecord::Base
  has_many :sales
  belongs_to :vendor

  validates_presence_of :name
end
