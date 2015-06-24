class MarketsController < ApplicationController

  def index
    @title = "All Markets"

    render :markets
  end

  def name_sort
    @all_markets = Market.all.order(:name)
    render :markets
  end

  def state_sort
    @all_markets = Market.all.order(:state)
    render :markets
  end

  def show
    @title = " information"
    @market_id =params[:id]
    @market = Market.find(@market_id)

    render :market_show
  end

  def new
    @market = Market.new(market_params[:market])
    @market.save
    
    render :new
  end

  private

  def market_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
