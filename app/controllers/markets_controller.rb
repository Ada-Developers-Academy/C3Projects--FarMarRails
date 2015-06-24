class MarketsController < ApplicationController

  def index

    @markets = Market.all

    render :index
  end
end
