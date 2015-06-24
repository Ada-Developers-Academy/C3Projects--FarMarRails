class MarketsController < ApplicationController

  def index
    @all_markets = Market.all
  end

  def show
    find_market
  end

  def edit
    find_market
  end

  def new
    @market = Market.new
  end

private

  def find_market
      id = params[:id]
      @market = Market.find(id)
  end

  def create_params
    params_permit(:market [:id, :name, :address, :city, :county, :state, :zip])
  end


end
