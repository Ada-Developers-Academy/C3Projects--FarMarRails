class ProductsController < ApplicationController

  def index
    @header = "Your Products"
    @vendor = Vendor.find(params[:vendor_id])
    @products = Product.where(:vendor_id => @vendor.id)
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @header= "Add a New Product"
    @adj = "Add"
    @product = Product.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new(create_params[:product])
    @product.save
    redirect_to vendor_products_path
  end

  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @header = "Edit Product"
    @adj = "Update"
    @product = Product.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
    @product.update(create_params[:product])
    redirect_to vendor_products_path
  end

  def destroy
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_products_path
  end

  private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end

end
