class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def by_market
    @market = Market.find(params[:market_id])
    @vendors = @market.vendors.to_a
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.create(market_params)
    @market.save
    redirect_to markets_path
  end

private

  def market_params
    params.require(:market).permit(:name, :address, :city, :state, :county, :zip)
  end
end
