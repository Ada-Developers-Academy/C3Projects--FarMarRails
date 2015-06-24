class UsersController < ApplicationController
  def index
    @header = "Farmer's Market Manager"
  end

  def markets
    @header = "All Markets"
    @markets = Market.order("lower(name) ASC").all
  end

  def by_market
    @market = Market.find(params[:id])
    @header = "This Market"
    @vendor = Vendor.where(:market_id => @market.id)
  end

end
