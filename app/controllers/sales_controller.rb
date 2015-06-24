class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales.to_a
    render :index
  end

  def sales_of_month
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales.to_a
    render :sales_of_month
    
  end
end
