class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def create
    @market = Market.new(permit_params[:market])
    @market.save

    redirect_to(markets_path)
  end

  def new
    @market = Market.new()
  end

  def show
    @market = Market.find(params[:id])

    @list_of_vendors = Vendor.where(:market_id => params[:id])
  end

  private

  def permit_params
    params.permit(market:[:name,:street_address,:city, :county, :state, :zip])
  end


end
