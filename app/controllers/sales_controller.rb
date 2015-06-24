class SalesController < ApplicationController

  def new

    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products

  end

  def create

    @sale = Sale.create(create_params[:sale])

    redirect_to vendor_path(params[:sale][:vendor_id])
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id, :id])

  end

end
