class WelcomeController < ApplicationController

  def index_markets
    @markets = Market.all
  end

  def show_market
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end
end
