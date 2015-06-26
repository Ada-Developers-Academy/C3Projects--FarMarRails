class UsersController < ApplicationController

  def index
    @header = "Farmer's Market Management"
  end

  def markets
    @header = "All Markets"
    @markets = Market.order("lower(name) ASC").all
  end

  def by_market
    @header = "Selected Market"
    @market = Market.find(params[:id])
    @vendor = Vendor.where(:market_id => @market.id)
  end

end
