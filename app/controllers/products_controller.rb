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

    render :index
  end

  def edit
    @product = Product.find(params[:id])

    render :edit_product
  end

  def update
    @product = Product.find(params[:id])
      new_name = params[:product][:name]
      new_vendor_id = params[:product][:vendor_id]

    @product.update(
                    name:      new_name,
                    vendor_id: new_vendor_id
    )
    @vendor = Vendor.find(params[:product][:vendor_id])
    @products = @vendor.products
    
    render :index
  end

  private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end

end
