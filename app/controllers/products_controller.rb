class ProductsController < ApplicationController

  def edit #GET one market to modify.
   @product = Product.find(params[:id])
  end

  def update #PATCH this updated market to the db
    @product = Product.find(params[:id])
    @product.name = permit_params[:product][:name]
    @product.vendor_id = permit_params[:product][:vendor_id]
    @product.save

    redirect_to(vendor_path(Vendor.find(@product.vendor_id)))
  end

  private

  def permit_params
    params.permit(product:[:name,:vendor_id])
  end
end
