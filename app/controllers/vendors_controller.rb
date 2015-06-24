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
  end

  def new
    @vendor = Vendor.new

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

    redirect_to(market_path(Market.find(@vendor.market_id)))
  end

private

  def permit_params
    params.permit(vendor:[:name,:no_of_employees,:market_id])
  end

end
