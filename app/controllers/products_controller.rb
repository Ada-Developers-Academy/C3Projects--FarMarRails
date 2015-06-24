class ProductsController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products.to_a
  end

  def new
    @product = Product.new
    @url = vendor_products_path
    @method = :post
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to vendor_products_path
  end

  def edit
    @product = Product.find(params[:id])
    @url = vendor_product_path
    @method = :patch
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    @product.save
    redirect_to vendor_products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :vendor_id)
  end

end
