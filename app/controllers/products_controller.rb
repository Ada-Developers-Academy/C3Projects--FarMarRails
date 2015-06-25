class ProductsController < ApplicationController

  def new
    @product = Product.new
    @vendor_id = params[:vendor_id]
    @url = "/vendors/#{@product.vendor_id}/products"
  end

  def create
    @product = Product.create(create_params[:product])
    # redirect_to "/vendors"
  end

##################### PRIVATE METHODS #####################
  private

  def find_product
      id = params[:id]
      @product = Product.find(id)
  end

  def create_params
    params.permit(product: [:id, :name, :vendor_id])
  end

end
