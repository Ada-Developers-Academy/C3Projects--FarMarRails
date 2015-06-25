class ProductsController < ApplicationController

  def new
    @product = Product.new
    @vendors = Vendor.all

    render :new
  end

  def create
    Product.create(create_product_params[:product])

    redirect_to controller: "vendors", action: "products", id: params[:product][:vendor_id]
  end

  def create_product_params
    params.permit(product: [:name, :vendor_id])
  end
end
