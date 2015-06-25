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
    @sales = Sale.where(vendor_id: params[:id])
    @total_amount = calculate_sale_amount(@sales)

# raise
    render 'vendor/sales'
  end

  def sales_this_month
    # sets timeframe
    @show_current_month = params[:show_current_month]
    if @show_current_month == "true"
      month_range = calculate_month_range

      @sales = Sale.where(
        vendor_id: params[:id],
        :purchase_time => month_range
        )
      # how to do this without searching database? gahh.
      @vendor_name = Vendor.find(params[:id]).name
    else
      @sales = Sale.where(vendor_id: params[:id])
    end

    @total_amount = calculate_sale_amount(@sales)

    render 'vendor/sales'
  end

  def products
    @vendor = Vendor.find(params[:id])
    @products = Product.where(vendor_id: params[:id])
    render 'vendor/products'
  end

  def show_product
    @product = Product.find(params[:id])
    render 'vendor/show_product'
  end

  def calculate_sale_amount(sales)
    total = 0
    unless sales.nil?
      sales.each do |sale|
        total += sale.amount
      end
    end
    return total
  end

  def calculate_month_range
    current_date_time = DateTime.now
    beginning_of_month = current_date_time.beginning_of_month
    end_of_month = current_date_time.end_of_month
    month_range = (beginning_of_month..end_of_month)
    return month_range
  end

end
