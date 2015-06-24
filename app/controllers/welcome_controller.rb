class WelcomeController < ApplicationController

  def index_markets
    @markets = Market.all
  end

  def show_market
    @market = Market.find(params[:id])
  end
end
