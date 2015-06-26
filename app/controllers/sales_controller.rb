class SalesController < ApplicationController
  before_action :set_nav
  before_action :set_vendor, only: [:new, :create]

  def new
    @sale = Sale.new
    @product = Product.find(params[:product_id])
  end

  # Carly helped us figure out how to permit entering amounts as dollars
  def create
    sale = Sale.create(sale_params)
    redirect_to vendor_product_path(@vendor, Product.find(params[:sale][:product_id]))
  end

  private
    def set_nav
      @nav = "vendor"
    end

    def set_vendor
      @vendor = Vendor.find(params[:vendor_id])
    end

    def sale_params
      sale_params = params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])[:sale]
      sale_params[:amount] = Sale.format_input(sale_params[:amount])

      sale_params
    end
end
