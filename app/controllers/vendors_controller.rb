class VendorsController < ApplicationController

  before_action :get_vendor, only: [:edit, :update, :destroy]

  def get_vendor
    @vendor = Vendor.find(params[:id])
  end

  def index
    @market_id = params[:market_id]
    @market = Market.find(@market_id)
    @vendors = @market.vendors

    render :index
  end

  def show
    @vendor_id = params[:id]
    @vendor = Vendor.find(@vendor_id)

    render :vendor_show
  end

  # Add a new vendor
  def new
    @vendor = Vendor.new(vendor_params[:vendor])
  end

  def create
    @vendor = Vendor.create(vendor_params[:vendor])

    redirect_to market_path(params[:market_id])
  end

  # Edit an existing vendor
  def edit
    render :edit
  end

  def update
    @vendor.update(vendor_params[:vendor])

    redirect_to market_vendor_path
  end

  def destroy
    @vendor.destroy

    redirect_to market_path(@vendor.market_id)
  end

  def landing
    render :vendor_login
  end

  def login
    vendor_id = params[:vendor_login]

    redirect_to vendor_portal_page_path(vendor_id)
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
      sale.purchase_time.to_date.strftime("%Y-%m") == @date_today ? @month_sales += sale.amount.to_i : nil
    end

    render :vendor_portal
  end

  private

  def vendor_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
