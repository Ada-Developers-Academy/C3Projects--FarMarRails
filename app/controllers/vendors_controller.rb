class VendorsController < ApplicationController
  def index

  end

  def show
    @vendor = Vendor.find(params[:id])
    @market = Market.find(params[:id])

    render :show
  end

  def new

  end

  def edit
    @vendor = Vendor.find(params[:id])

    render :edit_vendor
  end

  def update
    @vendor = Vendor.find(params[:id])
      new_name            = params[:vendor][:name]
      new_no_of_employees = params[:vendor][:no_of_employees]
      new_market_id       = params[:vendor][:market_id]


    @vendor.update(name:            new_name,
                   no_of_employees: new_no_of_employees,
                   market_id:       new_market_id,
                  )
    @market = Market.find(params[:id])              
    render :show
  end

  private

  def create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end
end
