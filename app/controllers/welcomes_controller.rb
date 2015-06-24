class WelcomesController < ApplicationController
  def index

  end

  def display_all_markets
    @markets = Market.all

    render :see_all_markets
  end

  def display_specific_market
    @market = Market.find(params[:id])

    render :specific_market
  end
end
