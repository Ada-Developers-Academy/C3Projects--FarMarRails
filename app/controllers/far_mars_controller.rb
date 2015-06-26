class FarMarsController < ApplicationController

  def index
    @page = "FarMar Welcome"
    @all_markets = Market.all
  end

end
