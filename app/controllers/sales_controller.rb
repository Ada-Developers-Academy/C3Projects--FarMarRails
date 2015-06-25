class SalesController < ApplicationController
  def index
    @sales = Product.find(params[:product_id]).sales
    @product = Product.find(params[:product_id])
    @vendor = @product.vendor

    render :index
  end

  def new
    @sale = Sale.new

    render :add_sale
  end

  def create
    @sale = Sale.new(create_params[:sale])
    @sale.save
    @sales = Product.find(params[:sale][:product_id]).sales
    @vendor = Product.find(params[:sale][:product_id]).vendor
    @product = Product.find(params[:sale][:product_id])

    render :index
  end


  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])
  end


end
