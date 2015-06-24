class ProductsController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.create(create_params[:product])

    redirect_to vendor_products_path
  end

  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.find(params[:id])
    @product.update(create_params[:product])

    redirect_to vendor_products_path
  end

  def destroy

  end

  private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end

end
