class ProductsController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def new
    @product = Product.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    params[:product][:vendor_id] = @vendor.id
    product = Product.new(create_params[:product])

    if product.valid?
      product.save

      redirect_to "/vendors/#{ @vendor.id }/products"
    else
      redirect_to "/vendors/#{ @vendor.id }/products/new/error"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    edited_product = create_params[:product]
    # edited_product[:vendor_id] = params[:vendor_id]

    if Product.new(edited_product).valid?
      product.update(edited_product)

      redirect_to "/vendors/#{ product.vendor_id }/products"
    else
      redirect_to "/vendors/#{ product.vendor_id }/products/new/error"
    end
  end

  def destroy
    vendor_id = params[:vendor_id]
    product = Product.find(params[:id])
    product.destroy

    redirect_to "/vendors/#{ vendor_id }/products"
  end

  private

  def create_params
    params.permit(product: [:name, :vendor_id])
  end

  # def update_params
  #   params.permit(product: [:name, :vendor_id])
  # end
end
