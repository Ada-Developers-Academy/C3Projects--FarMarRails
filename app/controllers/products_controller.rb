class ProductsController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products.to_a
  end
end
