class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all

    render :index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor_market = @vendor.market.name
    
    render :show
  end

  def update
  end

  def destroy
  end

end
