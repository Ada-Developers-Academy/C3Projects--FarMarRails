class VendorsController < ApplicationController

  def index
  end

  def show
    @title = " information"
    @vendor_id =params[:id]
    @vendor = Vendor.find(@vendor_id)

    render :market_show
  end

  def new
    @vendor = Vendor.new(vendor_params[:vendor])
  end

  def create
    @vendor = Vendor.new(vendor_params[:vendor])
    @vendor.save
    redirect_to :market_show
  end

  def vendor_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
