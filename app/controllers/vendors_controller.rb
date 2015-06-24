class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    render 'vendor/index'
  end

  def show
    @vendor = Vendor.find(params[:id])
    render 'vendor/show'
  end

  def sales
    # the only reason I used an instance variable
    # for @vendor was to be able to print it on the page
    @vendor = Vendor.find(params[:id])
    @sales = Sale.where(vendor_id: params[:id])
    render 'vendor/sales'
  end

  def products
    # the only reason I used an instance variable
    # for @vendor was to be able to print it on the page
    @vendor = Vendor.find(params[:id])
    @products = Product.where(vendor_id: params[:id])
    render 'vendor/products'
  end

  def show_product
    @product = Product.find(params[:id])
    render 'vendor/show_product'
  end
end
