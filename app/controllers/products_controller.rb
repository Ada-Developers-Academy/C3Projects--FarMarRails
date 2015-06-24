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
end

def show
end

def update
end

def destroy

end


private

def create_params
  params.permit(product: [:name, :vendor_id])
end

end
