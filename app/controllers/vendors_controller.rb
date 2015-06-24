class VendorsController < ApplicationController

  def index
  end

  # Add a new vendor
  def new
    @vendor = Vendor.new(vendor_params[:vendor])
  end

  def create
    @vendor = Vendor.new(vendor_params[:vendor])
    @vendor.save
    redirect_to :index
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

  private

  def vendor_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
