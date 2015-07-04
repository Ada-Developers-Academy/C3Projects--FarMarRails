class MarketsController < ApplicationController

  before_action :get_market, only: [:edit, :update]

  def get_market
    @market = Market.find(params[:id])
  end

  def index
    # @markets = Market.all
    if params[:search]
      @markets = Market.search(params[:search]).order("created_at DESC")
    else
      @markets = Market.all.order('created_at DESC')
    end
    render :markets
  end

  def search
    @markets = Market.search params[:search]
    render :search_results
  end

  def show
    @market_id = params[:id]
    @market = Market.find(@market_id)
  end

  # Add a new market
  def new
    @market = Market.new
  end

  def create
    @market = Market.create(market_params)

    redirect_to :markets
  end

  # Update an existing market
  def update
    @market.update(market_params)

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
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
