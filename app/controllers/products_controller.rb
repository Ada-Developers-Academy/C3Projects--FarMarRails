class ProductsController < ApplicationController

  def new

    @product = Product.new
  end

  def create

    @product = Product.create(create_params[:product])

    redirect_to vendor_path(@product.vendor_id)
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update
    @product = Product.find(params[:product][:id])
    @product.update(create_params[:product])

    redirect_to vendor_path(@product.vendor_id)
  end

  def destroy
    @product = Product.destroy(params[:id])

    redirect_to vendor_path(@product.vendor_id)

  end

  private

  def create_params
    params.permit(product: [:name, :vendor_id, :id])

  end


end
