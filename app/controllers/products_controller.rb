class ProductsController < ApplicationController

  before_action :get_product, only: [:edit, :update, :destroy]

  def get_product
    @product = Product.find(params[:id])
  end

  def index
    @vendor_id = params[:vendor_id]
    @vendor = Vendor.find(@vendor_id)
    @products = @vendor.products
  end

  # Add a new product
  def new
    @product = Product.new(product_params[:product])
    @vendor  = Vendor.find(params[:vendor_id])
  end

  def create
    @product = Product.create(product_params[:product])

    redirect_to market_vendor_products_path
  end

  # Edit an existing product
  def edit
    @vendor  = Vendor.find(@product.vendor_id)
  end

  def update
    @product.update(product_params[:product])

    redirect_to market_vendor_products_path
  end

  def destroy
    @product.destroy

    redirect_to market_vendor_products_path
  end

  private

  def product_params
    params.permit(product: [:name, :vendor_id])
  end

end
