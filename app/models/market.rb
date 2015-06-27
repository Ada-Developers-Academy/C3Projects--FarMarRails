class Market < ActiveRecord::Base
  has_many :vendors


  def self.search(query)
    where("name ILIKE ?", "%#{query}%")
  end
end
