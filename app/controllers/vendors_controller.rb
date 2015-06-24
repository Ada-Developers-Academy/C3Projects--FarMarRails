class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.create(create_params[:vendor])

    redirect_to market_path(market_id)

  end

  private

  def create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])

  end

end
