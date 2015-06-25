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
    @url = markets_path
    @method = :post
  end

  def create
    @market = Market.create(market_params)
    @market.save
    redirect_to markets_path
  end

  def edit
    @market = Market.find(params[:id])
    @url = market_path
    @method = :patch

  end

  def update
    @market = Market.find(params[:id])
    @market.update(market_params)
    @market.save
    redirect_to markets_path
  end

  def sort_by_name
    @markets = Market.all.order(:name)
    render :index
  end

  def sort_by_state
    @markets = Market.all.order(:state)
    render :index
  end

private

  def market_params
    params.require(:market).permit(:name, :address, :city, :state, :county, :zip)
  end
end
