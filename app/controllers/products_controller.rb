class ProductsController < ApplicationController

  def new
    @vendor_id = params[:vendor_id]
    @product = Product.new

    render :new
  end

  def create
    Product.create(create_product_params[:product])

    redirect_to controller: "vendors", action: "products", id: params[:product][:vendor_id]
  end

  def edit
    @product = Product.find(params[:product_id])

    render :edit
  end

  def update
    @product = Product.find(params[:product][:id])
    @product.update(create_product_params[:product])

    redirect_to controller: "vendors", action: "products", id: params[:product][:vendor_id]
  end

  def destroy
    # we will first destroy all sales assoc. with this product
    @sales = Sale.where(product_id: params[:product_id])
    @sales.destroy_all

    vendor_id = params[:id]
    Product.destroy(params[:product_id])

    redirect_to controller: "vendors", action: "products", id: vendor_id
  end

  private

  def create_product_params
    params.permit(product: [:name, :vendor_id])
  end
end
