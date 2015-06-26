class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    render 'vendors/index'
  end

  def show
    @vendor = Vendor.find(params[:id])
    render 'vendors/show'
  end

  def sales
    @sales = Sale.where(vendor_id: params[:id])
    @total_amount = calculate_sale_amount(@sales)

    render 'vendors/sales'
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

      @vendor_name = Vendor.find(params[:id]).name
    else
      @sales = Sale.where(vendor_id: params[:id])
    end

    @total_amount = calculate_sale_amount(@sales)

    render 'vendors/sales'
  end

  def products
    @products = Product.where(vendor_id: params[:id])

    render 'vendors/products'
  end

  def show_product
    @product = Product.find(params[:product_id])

    render 'vendors/show_product'
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
