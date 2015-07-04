class SalesController < ApplicationController

  # Add a sale for a product
  def new
    @sale    = Sale.new
    @vendor  = Vendor.find(params[:vendor_id]) 
  end

  def create
    @sale = Sale.create(sale_params)
    @vendor = Vendor.find(params[:vendor_id])

    redirect_to "/vendor_portal/#{params[:vendor_id]}"
  end

  private

  def sale_params
    params.require(:sale).permit(:amount, :purchase_time, :product_id, :vendor_id)
  end

end
