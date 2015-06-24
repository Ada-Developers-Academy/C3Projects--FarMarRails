class MarketsController < ApplicationController
  def index
    @markets = Market.all

  end

  def show
    @market = Market.find(params[:id])
  end

  def new
    @market = Market.new

    render :add_market
  end

  def create
    @market = Market.new(create_params[:market])
    @market.save

    render :index
  end

  def edit
    
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end
end
