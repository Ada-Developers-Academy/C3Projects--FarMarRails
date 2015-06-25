class SalesController < ApplicationController

  # Add a sale for a product
  def new
    @sale    = Sale.new(sale_params[:sale])
    @vendor  = Vendor.find(params[:vendor_id]) 
  end

  def create
    @sale = Sale.new(sale_params[:sale])
    @sale.save
    redirect_to "/vendor_portal/#{params[:vendor_id]}"
  end

  private

  def sale_params
    params.permit(sale: [:amount, :purchase_time, :product_id, :vendor_id])
  end

end
