class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    render 'vendor/index'
  end

  def show
    @vendor = Vendor.find(params[:id])
    render 'vendor/show'
  end

  def sales
    @sales = Sale.where(vendor_id: params[:id])
    render 'vendor/sales'
  end
end
