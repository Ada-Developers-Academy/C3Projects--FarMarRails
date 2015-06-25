class ProductsController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def new
    @product = Product.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    params[:product][:vendor_id] = @vendor.id
    product = Product.new(create_params[:product])

    if product.valid?
      product.save

      redirect_to "/vendors/#{@vendor.id}/products"
    else
      redirect_to "/vendors/#{@vendor.id}/products/new/error"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end

  private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end
end
