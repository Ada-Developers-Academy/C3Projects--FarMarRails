class VendorsController < ApplicationController

  def index
    @vendor = Vendor.new
  end

  def search

  end

  def show
    raise
    @vendor = Vendor.find(params[:id])
    # @vendor = Vendor.find(params["vendor"][":id"].to_i)
  end

end
