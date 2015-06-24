class VendorsController < ApplicationController
  def index

  end

  def show
    @vendor = Vendor.find(params[:id])

    render :show
  end

  def new

  end

  def edit

  end

  private

  def create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end
end
