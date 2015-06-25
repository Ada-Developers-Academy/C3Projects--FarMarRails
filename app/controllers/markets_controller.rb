class MarketsController < ApplicationController

  def index
    @header = "Farmer's Market Manager"
    @path = "market"
    @markets = Market.order("lower(name) ASC").all
    @vendors = Vendor.order("lower(name) ASC").all
  end

  def by_vendor
    @header = "Vendor Detail"
    @vendor = Vendor.find(params[:id])
  end

  def show
    @header = "Market Details"
    @market = Market.find(params[:id])
  end

  def new
    @header= "Add a New Market"
    @adj = "Add"
    @market = Market.new
  end

  def create
    @market = Market.new(create_params[:market])
    @market.save
    redirect_to markets_url
  end

  def edit
    @header = "Edit Market"
    @adj = "Update"
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    @market.update(create_params[:market])
    redirect_to markets_url
  end

  def destroy
    @market = Market.find(params[:id])
    @market.destroy
    redirect_to markets_path
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
