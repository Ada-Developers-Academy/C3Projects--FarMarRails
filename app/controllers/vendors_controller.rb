class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @market = Market.find(params[:market_id])
    @vendor = Vendor.new
    @legend = "Add vendor information below:"
    @url = "/markets/#{@market.id}/vendors"

  end

  def create
    @id = :market_id
    @market = Market.find(params[:market_id])
    @vendor = Vendor.create(create_params[:vendor])
    @value = @market.id


    redirect_to market_portal_path
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    show
    @market = Market.find(params[:market_id])
    @legend = "Add vendor information below:"
    @id = :id
    @url = "/markets/#{@market.id}/vendors/#{@vendor.id}"
    @value = @vendor.id

  end

  def update
    show
    @market = Market.find(params[:market_id])
    @vendor.update(create_params[:vendor])

    redirect_to market_portal_path
  end

  def destroy
    show
    @vendor.destroy

    redirect_to market_vendors_path
  end

  private

  def create_params
    params.permit(vendor: [:name, :num_employees, :market_id])
  end

end
