class MarketsController < ApplicationController
  def index
    @markets = Market.all
    render :index
  end

  def show
    @market = Market.find(params[:id])
    render :show
  end

  def vendors
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    render :vendors
  end

end
