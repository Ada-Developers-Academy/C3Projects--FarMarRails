class UsersController < ApplicationController

  def index
    @markets = Market.all

    render :index
  end

  def show
    @market = Market.find(params[:id])

    @display_vendors = @market.vendors
  end

end
