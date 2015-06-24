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

    @month = Date.new.strftime('%Y%m')
    @show_current_month = params[:show_current_month]

    # this will make a new array @sales of only the sales for that month
    if @show_current_month
      @sales = @sales.each do |sale|
        if sale.purchase_time.strftime('%Y%m') == @month
          sale
        end
      end
    end

    @total_amount = 0
    @sales.each do |sale|
      @total_amount += sale.amount
    end

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
