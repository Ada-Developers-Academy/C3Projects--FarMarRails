class WelcomeController < ApplicationController
  before_action :set_nav

  def index_markets
    @markets = Market.all
  end

  def show_market
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  private
    def set_nav
      @nav = "welcome"
    end
end
