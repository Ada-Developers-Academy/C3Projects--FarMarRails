class Market < ActiveRecord::Base
  has_many :vendors

  validates_presence_of :name
end
