class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def create
    @market = Market.create(create_params[:market])

    redirect_to market_portal_path
  end

  def new
    @market = Market.new
  end

  def edit
    show
  end

  def show
    @market = Market.find(params[:id])
  end

  def market_portal
    @markets = Market.all
  end

  def update
    show
    @market.update(create_params[:market])

    redirect_to market_portal_path
  end

  def vendors_in_market
    @market = Market.find(params[:market_id])
    @vendors = @market.vendors
  end

  def market_search
    @markets = Market.search(params[:search])
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
