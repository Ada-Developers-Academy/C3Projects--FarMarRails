class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_vendor, only: [:show, :new, :create, :edit, :update, :destroy]

  def show
    @sales = @product.sales
  end

  @product.sales.where("strftime('%m', date_column) + 0 = ?", Sale.current_month)

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    redirect_to vendor_product_path(@vendor, product)
  end

  def update
    @product.update(product_params)
    redirect_to vendor_product_path(@vendor, @product)
  end

  def destroy
    @product.destroy
    redirect_to vendor_path(@vendor)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_vendor
      @vendor = Vendor.find(params[:vendor_id])
    end

    def product_params
      params.permit(product: [:name, :vendor_id])[:product]
    end
end
