class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def current_month_sales
    @vendor = Vendor.find(params[:vendor_id])
    @current_month = Sale.current_month.all
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.create(create_params[:sale])

    redirect_to vendor_sales_path
  end


  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])
  end

end
