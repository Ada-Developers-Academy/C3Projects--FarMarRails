class MarketsController < ApplicationController

  def index
    @title = "All Markets"

    render :markets
  end

  def show
    @title = " information"
    @market_id =params[:id]
    @market = Market.find(@market_id)

    render :market_show
  end

end
