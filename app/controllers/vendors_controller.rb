class VendorsController < ApplicationController

  def index
    @title = "Vendors for "
    @vendor_id =params[:id]
    @vendor = Vendor.find(@vendor_id)
    @market = @vendor.market

    render :index
  end

  def show
    @title = " information"
    @vendor_id =params[:id]
    @vendor = Vendor.find(@vendor_id)

    render :vendor_show
  end

  def new
    @vendor = Vendor.new(vendor_params[:vendor])
  end

  def create
    @vendor = Vendor.new(vendor_params[:vendor])
    @vendor.save
    redirect_to :index
  end

  def vendor_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
