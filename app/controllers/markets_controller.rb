class MarketsController < ApplicationController

  def index
    @all_markets = Market.all
  end

  def show
    find_market
  end

private

  def find_market
      id = params[:id]
      @market = Market.find(id)
  end

  def create_params
    params_permit(:market [:name, :id])
  end


end
