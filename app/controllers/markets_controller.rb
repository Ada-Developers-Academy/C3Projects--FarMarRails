class MarketsController < ApplicationController

  def index
    @title = "All Markets"

    render :markets
  end

end
