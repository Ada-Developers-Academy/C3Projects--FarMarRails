class MarketsController < ApplicationController

  def index
    @all_markets = Market.all
    @page = "Market Portal"
  end

  def view
    find_market
    @market_vendors = Vendor.where(market_id: "#{@market.id}")
    @page = "Show Market"
  end

  def show
    find_market
    @market_vendors = Vendor.where(market_id: "#{@market.id}")
    @page = "Show Market"
  end

  def edit
    find_market
    @page = "Edit Market"
  end

  def update
    find_market
    @market.update(create_params[:market])

    redirect_to '/markets'
  end

  def new
    @market = Market.new
    @page = "New Market"
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
