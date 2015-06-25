class VendorsController < ApplicationController

  def index
    @vendor = Vendor.new
  end

  def confirm
    @vendor = Vendor.find(params[:id])

    redirect_to vendor_path(@vendor)
  end

  def show
    @vendor = Vendor.find(params[:id])

    @products = Product.where(:vendor_id => params[:id])
    @sales = Sale.where(:vendor_id => params[:id])

    # MONTH DISPLAY CODE #
    current_year = DateTime.now.year
    current_month = DateTime.now.month

    month_sales = []

    @sales.each do |sale|
      answer = sale[:purchase_time] <=> DateTime.new(current_year, current_month)

      if answer == 1
        month_sales.push(sale)
      end
    end

    @sales = month_sales
    # MONTH DISPLAY CODE #

    sum = 0
    @sales.each do |sale|
      sum += sale[:amount]
    end

    @total_sales = sum

  end

  def create
    @vendor = Vendor.new(permit_params[:vendor])
    @vendor.save

    redirect_to(market_path(market_of_vendor))
  end

  def new
    @market_id = params[:market_id]
    @vendor = Vendor.new
    @vendor.market_id = @market_id

  end

  def edit
    @vendor = Vendor.find(params[:id])

  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.name = permit_params[:vendor][:name]
    @vendor.no_of_employees = permit_params[:vendor][:no_of_employees]
    @vendor.market_id = permit_params[:vendor][:market_id]
    @vendor.save

    redirect_to(market_path(market_of_vendor))
  end

def destroy
  @vendor = Vendor.find(params[:id]).destroy

  redirect_to(market_path(market_of_vendor))
end


private

  def permit_params
    params.permit(vendor:[:name,:no_of_employees,:market_id])
  end

  def market_of_vendor
    Market.find(@vendor.market_id)
  end

end
