class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @market = Market.find(params[:id])
  end

  def market_portal
    @markets = Market.all
  end

  def update
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
