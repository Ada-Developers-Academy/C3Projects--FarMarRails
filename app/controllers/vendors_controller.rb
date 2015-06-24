class VendorsController < ApplicationController

  def index
    @vendor = Vendor.new
  end

  def confirm
    @vendor = Vendor.find(params[:id])

    redirect_to vendor_path(@vendor)
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

end
