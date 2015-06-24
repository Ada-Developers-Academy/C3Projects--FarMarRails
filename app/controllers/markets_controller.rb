class MarketsController < ApplicationController
  def index
    @all_markets = Market.all
    render :index
  end

end
