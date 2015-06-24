class VendorsController < ApplicationController
  def index

  end

  def show
    @vendor = Vendor.find(params[:id])
    @market = Market.find(params[:market_id])

    render :show
  end

  def new
    @vendor = Vendor.new

    render :add_vendor
  end

  def create
    @vendor = Vendor.new(create_params[:vendor])
    @vendor.save
    @market = Market.find(params[:vendor][:market_id])
    @vendors = @market.vendors

    render "markets/show"
  end

  def edit
    @vendor = Vendor.find(params[:id])

    render :edit_vendor
  end

  def update
    @vendor = Vendor.find(params[:id])
      new_name            = params[:vendor][:name]
      new_no_of_employees = params[:vendor][:no_of_employees]


    @vendor.update(name:            new_name,
                   no_of_employees: new_no_of_employees
                  )
    @market = Market.find(params[:vendor][:market_id])
    render :show
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    @market = Market.find(params[:market_id])
    @vendors = @market.vendors
    render "markets/show"
  end

  private

  def create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end
end
