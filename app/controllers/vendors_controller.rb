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
    redirect_to market_vendors_path
  end

  # Edit an existing vendor
  def edit
    @vendor = Vendor.find(params[:id])
    render :edit
  end

  def update
    @vendor = vendor.find(params[:id])
    @name = vendor_params[:market][:name]
    @no_of_employees = vendor_params[:market][:no_of_employees]

    @vendor.update(name: @name)
    @vendor.update(no_of_employees: @no_of_employees)
    @vendor.save

    redirect_to :vendors
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    redirect_to market_vendors_path
  end

  private

  def vendor_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
