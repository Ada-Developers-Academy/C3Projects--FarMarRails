class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def create
    @vendor = Vendor.create(create_params[:vendor])

    redirect_to market_portal_path
  end

  def new
    @vendor = Vendor.new
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    show
  end

  def update
    show
    @vendor.update(create_params[:vendor])

    redirect_to market_portal_path
  end

  def destroy
  end

  private

  def create_params
    params.permit(vendor: [:name, :num_employees, :market_id])
  end

end
