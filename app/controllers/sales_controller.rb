class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def current_month_sales
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
    @current_month = @sales.current_month.all
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    params = create_params[:sale]
    params[:amount] = params[:amount].to_f * 100
    @sale = Sale.create(params)

    redirect_to vendor_sales_path
  end


  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])
  end

end
