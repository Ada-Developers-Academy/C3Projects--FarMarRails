class UsersController < ApplicationController

  def index

    render :index
  end

  def show
    @title = "Welcome Market"

    render :all_markets
  end
end
