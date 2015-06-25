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
    product.save

    redirect_to "/vendors/#{@vendor.id}/products"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    vendor_id = params[:vendor_id]
    product = Product.find(params[:id])
    edited_product = params[:product]

    product.update(name: edited_product[:name])

    # update when vendor#show is created
    redirect_to "/vendors/#{vendor_id}/products"
  end

  def destroy
    vendor_id = params[:vendor_id]
    product = Product.find(params[:id])
    product.destroy

    redirect_to "/vendors/#{vendor_id}/products"
  end

  private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end
end
