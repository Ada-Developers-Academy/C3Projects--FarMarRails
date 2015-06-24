class MarketsController < ApplicationController

  def index
    @all_markets = Market.all
  end

  def view
    find_market
    @market_vendors = Vendor.where(market_id: "#{@market.id}")
  end

  def show
    find_market
    @market_vendors = Vendor.where(market_id: "#{@market.id}")
  end

  def edit
    find_market
  end

  def update
    find_market
    @market.update(create_params[:market])

    redirect_to '/markets'
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(create_params[:market])
    @market.save

    redirect_to '/markets'
  end

##################### PRIVATE METHODS #####################
  private

  def find_market
      id = params[:id]
      @market = Market.find(id)
  end

  def create_params
    params.permit(market: [:id, :name, :address, :city, :county, :state, :zip])
  end


end
