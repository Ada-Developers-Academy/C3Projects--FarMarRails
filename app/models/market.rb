class Market < ActiveRecord::Base
  has_many :vendors

def self.search(search)
    where("name like ?", "%#{search}%")
  end

end
