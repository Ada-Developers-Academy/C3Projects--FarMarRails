class MarketsController < ApplicationController

  def index
    @display_me = Market.find(1).name

    render :index
  end

end
