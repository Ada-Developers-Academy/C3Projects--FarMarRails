class Market < ActiveRecord::Base
  has_many :vendors

  accepts_nested_attributes_for :vendors, allow_destroy: true
end
