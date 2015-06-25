class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    render 'vendor/index'
  end

  def show
    @vendor = Vendor.find(params[:id])
    render 'vendor/show'
  end

# THIS METHOD IS DOING TOO MUCH!!! REFACTOR WHEN YOU HAVE A CHANCE! - C
  def sales
    @sales = Sale.where(vendor_id: params[:id])

    @total_amount = 0
    unless @sales.nil?
      @sales.each do |sale|
        @total_amount += sale.amount
      end
    end
# raise
    render 'vendor/sales'
  end

  def sales_this_month
    # sets timeframe
    @show_current_month = params[:show_current_month]
    if @show_current_month == "true"
      # current_date_time = DateTime.now
      # beginning_of_month = current_date_time.beginning_of_month
      # end_of_month = current_date_time.end_of_month
      # @month_range = (beginning_of_month..end_of_month)

      @sales = Sale.where(vendor_id: params[:id], purchase_time: @month_range)

    # this will make a new array @sales of only the sales for that month
      # @sales = @sales.map do |sale|
      #   if @month_range.include?(sale.purchase_time)
      #     sale
      #   end
      # end
    else
      @sales = Sale.where(vendor_id: params[:id])
    end


    @total_amount = 0
    unless @sales.nil?
      @sales.each do |sale|
        @total_amount += sale.amount
      end
    end

    render 'vendor/sales'
  end

  def products
    @products = Product.where(vendor_id: params[:id])
    render 'vendor/products'
  end

  def show_product
    @product = Product.find(params[:id])
    render 'vendor/show_product'
  end
end
