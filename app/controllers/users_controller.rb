class UsersController < ApplicationController

  def index

    render :index
  end

  def show
    @title = "Welcome Market"

    render :all_markets
  end

  def market_details
    @title = " information"
    @market_id =params[:id]
    @market = Market.find(@market_id)

    render :market_show
  end
end
