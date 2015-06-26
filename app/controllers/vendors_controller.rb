class VendorsController < ApplicationController

  def index
    @all_vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
    @market_id = params[:market_id]
    @url = market_vendors_path
  end

  def create
    @vendor = Vendor.create(create_params[:vendor])
    redirect_to "/markets/#{@vendor.market_id}"
  end

	def show
    find_vendor
		@market = Market.find("#{@vendor.market_id}")
    @current_month = Time.now.month

    @vendor_products = Product.where(vendor_id: "#{@vendor.id}")

    sum_vendor_total_sales
    sum_vendor_month_sales
  end

  def sum_vendor_total_sales
    find_vendor
    vendor_sales = Sale.where(vendor_id: "#{@vendor.id}")

    vendor_total_amounts = []

    vendor_sales.each do |sale|
      vendor_total_amounts.push(sale.amount)
    end
    @grand_total = vendor_total_amounts.reduce(:+) / 100
  end

  def sum_vendor_month_sales
    find_vendor
    @current_month = Time.now.month

    vendor_sales = Sale.where(vendor_id: "#{@vendor.id}")

    vendor_monthly_amounts = []

    vendor_sales.each do |sale|
      if sale.purchase_time.month == @current_month
        vendor_monthly_amounts.push(sale.amount)
      else
        vendor_monthly_amounts.push(0)
      end
    end

    @month_total = vendor_monthly_amounts.reduce(:+) / 100
  end

  # WIP- Displaying total & monthly sales by product...

  # def sum_product_total_sales
  #   find_vendor
  #   @vendor_products = Product.where(vendor_id: "#{@vendor.id}")
  #   amounts = []

  #   @vendor_products.each do |product|
  #     sales = product.sales

  #     sales.each do |sale|
  #       amounts.push(sale.amount)
  #     end
  #   end

  #   @product_total_amount = amounts.reduce(:+)
  # end

  # def sum_product_month_sales(product)
  #   sales = product.sales
  #   @current_month = Time.now.month
  #   monthly_amounts = []

  #   sales.each do |sale|
  #     if sale.purchase_time.month == @current_month
  #       monthly_amounts.push(sale.amount)
  #     else
  #       monthly_amounts.push(0)
  #     end
  #   end

  #   @product_month_total_amount = monthly_amounts.reduce(:+)
  # end

  def edit
    find_vendor
    @market_id = params[:market_id]
    @url = market_vendor_path
  end

  def update
    find_vendor
    @vendor.update(create_params[:vendor])

    redirect_to market_path(@vendor.market_id)
  end

  def destroy
    find_vendor
    @vendor.destroy

    redirect_to market_path(@vendor.market_id)
  end

##################### PRIVATE METHODS #####################
  private

  def find_vendor
      id = params[:id]
      @vendor = Vendor.find(id)
  end

  def create_params
    params.permit(vendor: [:id, :name, :num_employees, :market_id])
  end

end
