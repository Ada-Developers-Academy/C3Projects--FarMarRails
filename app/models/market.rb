class Market < ActiveRecord::Base
  has_many :vendors

  validates_presence_of :name, :address, :city, :county, :state, :zipcode
end
