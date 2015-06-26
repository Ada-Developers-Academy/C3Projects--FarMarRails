class ProductsController < ApplicationController

  def new
    @product = Product.new
    # do we need this line? (below)
    @vendors = Vendor.all

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
    vendor_id = params[:id]
    @sales = Sale.where(product_id: params[:product_id])
    @sales.destroy_all
    Product.destroy(params[:product_id])

    redirect_to controller: "vendors", action: "products", id: vendor_id
  end

  private

  def create_product_params
    params.permit(product: [:name, :vendor_id])
  end
end
