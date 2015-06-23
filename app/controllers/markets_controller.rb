class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    market = Market.new(create_params[:market])
    market.save
    redirect_to "/markets"
  end

  def edit
    @market = Market.find(params[:id])
  end

  private

  def create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zipcode])
  end
end
