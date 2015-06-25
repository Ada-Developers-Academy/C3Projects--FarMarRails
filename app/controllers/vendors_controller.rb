class VendorsController < ApplicationController

  def index
    @title = "Vendors for "
    @market_id = params[:market_id]
    @market = Market.find(@market_id)
    @vendors = @market.vendors
    render :index
  end


  def show
    @title = " information"
    @vendor_id =params[:id]
    @vendor = Vendor.find(@vendor_id)

    render :vendor_show
  end

  # Add a new vendor
  def new
    @vendor = Vendor.new(vendor_params[:vendor])
  end

  def create
    @vendor = Vendor.new(vendor_params[:vendor])
    @vendor.save

    redirect_to market_path(@vendor.market_id)
  end

  # Edit an existing vendor
  def edit
    @vendor = Vendor.find(params[:id])
    render :edit
  end

  def update
    @vendor = Vendor.find(params[:id])
    @name = vendor_params[:vendor][:name]
    @no_of_employees = vendor_params[:vendor][:no_of_employees]

    @vendor.update(name: @name)
    @vendor.update(no_of_employees: @no_of_employees)
    @vendor.save

    redirect_to market_vendor_path
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    redirect_to market_vendors_path
  end

  def login
    render :vendor_login
  end

  def portal
    @vendor_id = params[:id]
    @vendor = Vendor.find(@vendor_id)
    @sales = @vendor.sales.all
    @total_sales = 0
    @sales.each do |sale|
      @total_sales += sale.amount.to_i
    end
    @date_today = Date.today.strftime("%Y-%m")
    @month_sales = 0
    @sales.each do |sale|
      if sale.purchase_time.to_date.strftime("%Y-%m") == @date_today
        @month_sales += sale.amount.to_i
      end
    end
    render :vendor_portal
  end

  private

  def vendor_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
