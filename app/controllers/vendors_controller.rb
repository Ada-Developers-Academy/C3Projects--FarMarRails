class VendorsController < ApplicationController

  def index

  end

  def show
    @vendor = Vendor.find(params["vendor"][":id"].to_i)
  end

end
