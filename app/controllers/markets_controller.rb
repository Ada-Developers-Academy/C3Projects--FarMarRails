class MarketsController < ApplicationController

  def index
    @title = "All Markets"
    @markets = Market.all
    render :markets
  end

  def show
    @title = " information"
    @market_id = params[:id]
    @market = Market.find(@market_id)

    render :market_show
  end

  # Add a new market
  def new
    @market = Market.new(market_params[:market])
  end

  def create
    @market = Market.create(market_params[:market])

    redirect_to :markets
  end

  # Update an existing market
  def edit
    @market = Market.find(params[:id])
    render :edit
  end

  def update
    @market = Market.find(params[:id])
    @market.update(market_params[:market])

    redirect_to :markets
  end

  def name_sort
    @markets = Market.order(:name)
    render :markets
  end

  def city_sort
    @markets = Market.order(:city)
    render :markets
  end

  def state_sort
    @markets = Market.order(:state)
    render :markets
  end

  private

  def market_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
