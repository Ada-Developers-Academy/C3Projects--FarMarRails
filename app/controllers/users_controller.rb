class UsersController < ApplicationController
  def index
  end

  def market_dashboard
    render :market
  end

  def vendor_dashboard
    render :vendor
  end
end
