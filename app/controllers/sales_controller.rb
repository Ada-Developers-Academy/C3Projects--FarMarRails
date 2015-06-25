class SalesController < ApplicationController

  def create
    @sale = Sale.new(permit_params[:sale])
    @sale[:purchase_time] = DateTime.now
    @sale.save

    redirect_to(vendor_path(Vendor.find(@sale.vendor_id)))
  end

  def new
    @vendor_id = params[:vendor_id]
    @product_id = params[:product_id]
    @sale = Sale.new
    @sale.vendor_id = @vendor_id
    @sale.product_id = @product_id
  end

  private

  def permit_params
    params.permit(sale:[:amount,:purchase_time,:vendor_id,:product_id])
  end
end
