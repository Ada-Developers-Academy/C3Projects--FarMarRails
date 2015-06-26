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
    @vendor_name = @sales.first.vendor.name
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
      @vendor_name = @sales.first.vendor.name
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

  ### Elsa's rerouting actions ###

  def vendors_index
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    render :vendors_index
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    Vendor.create(vendor_params)
    redirect_to vendors_market_path(id: params[:vendor][:market_id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(vendor_params)
    redirect_to vendor_path
  end

  def destroy
    vendor = Vendor.find(params[:id])
    vendor.destroy
    redirect_to vendors_market_path(id: params[:market_id])
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :num_employees, :market_id, :_destroy)
  end

end
