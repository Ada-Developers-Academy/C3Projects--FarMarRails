class VendorsController < ApplicationController
  before_action :set_nav
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]
  before_action :set_market, only: [:new, :create, :edit, :update, :destroy]

  def index
    @vendors = Vendor.all
  end

  def show
    if params[:market_id]
      set_market
      render 'show_from_markets'
    end

    # TODO: come back to this
    @sales = @vendor.sales
    ### @current_month_sales # TODO: COME BACK TO THIS!
    @current_month_sales = @vendor.current_month_sales
    # @current_sales = @product.sales.where(:purchase_time.month == Sale.current_month)
  end

  def new
    @vendor = Vendor.new
  end

  # vendors are only created, updated, or destroyed from market path

  def create
    vendor = Vendor.create(vendor_params)
    redirect_to market_vendor_path(@market, vendor)
  end

  def update
    @vendor.update(vendor_params)
    redirect_to market_vendor_path(@market, @vendor)
  end

  def destroy
    @vendor.archive
    redirect_to market_path(@market)
  end

  private
    def set_nav
      @nav = params[:market_id] ? "market" : "vendor"
    end

    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def set_market
      @market = Market.find(params[:market_id])
    end

    def vendor_params
      params.permit(vendor: [:name, :num_employees, :market_id] )[:vendor]
    end
end
