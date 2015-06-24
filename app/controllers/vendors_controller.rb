class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show]
  before_action :set_market, only: [:new, :create]

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    vendor = Vendor.create(vendor_params)
    redirect_to market_vendor_path(@market, vendor)
  end

  private
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
