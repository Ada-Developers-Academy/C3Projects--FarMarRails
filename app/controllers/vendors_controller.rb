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
    redirect_to :index
  end

  # Edit an existing vendor
  def update
    @market = Market.find(params[:id])
    @name = market_params[:market][:name]
    @address = market_params[:market][:address]
    @city = market_params[:market][:city]
    @county = market_params[:market][:county]
    @state = market_params[:market][:state]
    @zip = market_params[:market][:zip]

    @market.update(name: @name)
    @market.update(address: @address)
    @market.update(city: @city)
    @market.update(county: @county)
    @market.update(state: @state)
    @market.update(zip: @zip)
    @market.save

    redirect_to :markets
  end

  def vendor_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
