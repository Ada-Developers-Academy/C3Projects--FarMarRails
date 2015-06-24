class ProductsController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products= @vendor.products

  end

  def new
    @product = Product.new

    render :add_product
  end

  def create
    @product = Product.new(create_params[:product])
    @product.save
    @vendor = Vendor.find(params[:product][:vendor_id])
    @products = @vendor.products

    render :show
  end



  private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end

end
