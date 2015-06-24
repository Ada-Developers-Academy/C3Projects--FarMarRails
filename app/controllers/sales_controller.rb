class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def create
    @sale = Sale.create(sale_params)
    @sale.save
    redirect_to vendor_sales_path
  end

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales.to_a
    render :index
  end

  def sales_of_month
    @vendor = Vendor.find(params[:vendor_id])
    @sales_collection = @vendor.sales.to_a
    @sales = Sale.sales_by_month(@sales_collection)
    render :sales_of_month
    
  end

  private

  def sale_params
    params.require(:sale).permit(:amount, :purchase_time, :vendor_id, :product_id)
  end
end






