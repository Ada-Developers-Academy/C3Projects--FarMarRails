class MarketsController < ApplicationController

  def index

    @markets = Market.all

    render :index
  end

  def show

    @market = Market.find(params[:id])
    @display_vendors = @market.vendors
    render :show



  end
end
