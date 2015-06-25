class ProductsController < ApplicationController

  def index
    @title = "Products for "
    @vendor_id = params[:vendor_id]
    @vendor = Vendor.find(@vendor_id)
    @products = @vendor.products
    render :index
  end

  def show
  end

  # Add a new product
  def new
    @product = Product.new(product_params[:product])
    @vendor  = Vendor.find(params[:vendor_id])
  end

  def create
    @product = Product.create(product_params[:product])
    redirect_to :index
  end

  # Edit an existing product
  def edit
    @product = Product.find(params[:id])
    @vendor  = Vendor.find(@product.vendor_id)

    render :edit
  end

  def update
    @product = Product.find(params[:id])
    @name = product_params[:product][:name]

    @market.update(name: @name)
    @market.save

    redirect_to :products
  end

  private

  def product_params
    params.permit(product: [:name])
  end

end
