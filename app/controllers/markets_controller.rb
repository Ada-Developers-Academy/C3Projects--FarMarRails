class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def create

  end

  def new

  end

  def edit

  end

  def show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def update

  end



end
