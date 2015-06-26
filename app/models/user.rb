class User < ActiveRecord::Base
  has_many :markets
  has_many :vendors, through: :markets
end
