class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    @market.update(market_params)
    redirect_to market_path
  end

  def new
    @market = Market.new
  end

  def create
    Market.create(market_params)
    redirect_to markets_path
  end

  def vendors_index
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
