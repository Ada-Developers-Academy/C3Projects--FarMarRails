class MarketsController < ApplicationController

  def index
    @title = "All Markets"

    render :markets
  end

  def show
    @title = " information"
    @market_id =params[:id]
    @market = Market.find(@market_id)

    render :market_show
  end

  # Add a new market
  def new
    @market = Market.new(market_params[:market])
  end

  def create
    @market = Market.new(market_params[:market])
    @market.save

    redirect_to :markets
  end

  # Update an existing market
  def edit
    @market = Market.find(params[:id])
    render :edit
  end

  def update
    @market = Market.find(params[:id])
    @name = market_params[:market][:name]
    @address = market_params[:market][:address]
    @city = market_params[:market][:city]
    @county = market_params[:market][:county]
    @state = market_params[:market][:state]
    @zip = market_params[:market][:zip]

    @market.update(name: @name)
    @market.update(address: @address)
    @market.update(city: @city)
    @market.update(county: @county)
    @market.update(state: @state)
    @market.update(zip: @zip)
    @market.save

    redirect_to :markets
  end

  private

  def market_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

  def name_sort
    @all_markets = Market.all.order(:name)
    render :markets
  end

  def state_sort
    @all_markets = Market.all.order(:state)
    render :markets
  end

end
