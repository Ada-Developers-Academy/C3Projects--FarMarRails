class ProductsController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @vendor_products = @vendor.products

    render :index
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new(create_params[:product])
    @product.save

    redirect_to "/vendors/#{@vendor.id}/products"
  end

  def new
    @product = Product.new
    @vendor = Vendor.find(params[:vendor_id])
    @url = "/vendors/#{@vendor.id}/products"

    render :new
  end

  def edit
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
    @url = "/vendors/#{@vendor.id}/products/#{@product.id}"

    render :edit
  end

  def show
  end

  def update
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
    product_params = create_params[:product]
    @product.update(product_params)

    redirect_to "/vendors/#{@vendor.id}/products"
  end

  def destroy
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to "/vendors/#{@vendor.id}/products"
  end


private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end

end
