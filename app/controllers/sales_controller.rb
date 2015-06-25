class SalesController < ApplicationController

  # Add a sale for a product
  def new
    @sale    = Sale.new(sale_params[:sale])
    @vendor  = Vendor.find(params[:vendor_id]) 
  end

  def create
    @sale = Sale.create(sale_params[:sale])
    redirect_to :index
  end

  private

  def sale_params
    params.permit(sale: [:amount, :purchase_time])
  end


end
