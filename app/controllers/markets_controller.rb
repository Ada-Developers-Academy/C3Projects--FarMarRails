class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update]

  def index
    @markets = Market.all
  end

  def show
  end

  def new
    @market = Market.new
  end

  def create
    market = Market.create(market_params)
    redirect_to market
  end

  def edit
  end

  def update
    @market.update(market_params)
    redirect_to @market
  end

  private
    def set_market
      @market = Market.find(params[:id])
    end

    def market_params
      params.permit(market: [:name, :address, :city, :county, :state, :zip] )[:market]
    end
end
