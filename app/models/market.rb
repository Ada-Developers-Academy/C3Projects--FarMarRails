class Market < ActiveRecord::Base
  has_many :vendors

  scope :search, ->(search) { where("name like ?", "%#{search}%")}

end
