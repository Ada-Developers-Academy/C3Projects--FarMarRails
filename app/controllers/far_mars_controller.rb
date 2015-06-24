class FarMarsController < ApplicationController

  def index
    @all_markets = Market.all
  end

end
