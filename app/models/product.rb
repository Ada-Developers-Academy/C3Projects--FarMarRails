class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  def archive
    update(archived: true)
  end

end
