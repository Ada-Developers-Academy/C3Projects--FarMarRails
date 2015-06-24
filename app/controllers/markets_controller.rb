class MarketsController < ApplicationController

  def index
    @header = "Farmer's Market Manager"
    @markets = Market.order("lower(name) ASC").all
    @vendors = Vendor.order("lower(name) ASC").all
  end

  def by_vendor
    @header = "Vendor Detail"
    @vendor = Vendor.find(params[:id])
  end

  def show
    @header = "Market Details"
    @market = Market.find(params[:id])
  end
end
