class SalesController < ApplicationController

  def index
    @header = "Your Sales"
    @vendor = Vendor.find(params[:id])
    @sales = Sale.where(:vendor_id => @vendor.id)
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @header= "Create a Sale"
    @product = Product.find(params[:product_id])
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:product_id])
    @sale = Sale.new(create_params[:sale])
    @sale.save
    redirect_to sales_path
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])
  end


end
