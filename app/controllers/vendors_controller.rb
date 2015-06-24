class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
    @url = market_vendors_path
    @method = :post
  end

  def create
    @vendor = Vendor.create(vendor_params)
    @vendor.save
    redirect_to by_market_path
  end

  def edit
    @vendor = Vendor.find(params[:id])
    @url = market_vendor_path
    @method = :patch
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(vendor_params)
    @vendor.save
    redirect_to by_market_path
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to by_market_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :num_of_employees, :market_id)
  end

end
