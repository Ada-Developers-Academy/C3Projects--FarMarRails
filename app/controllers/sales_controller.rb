class SalesController < ApplicationController
  def index
    # coming from vendors
    @products = Vendor.find(params[:vendor_id]).products
    @sales = Vendor.find(params[:vendor_id]).sales
    @total_sales = add_sale_amounts(@sales)

    # coming from vendors > products > sales
    if params[:product_id]
      @sales = Product.find(params[:product_id]).sales
      @product = Product.find(params[:product_id])
      @vendor = @product.vendor
    end
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

  def add_sale_amounts(all_sales)
    total = 0
    all_sales.each do |sale|
      total += sale.amount
    end
    return total
  end


end
