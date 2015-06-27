class WelcomeController < ApplicationController

def home
  @markets = Market.all
  render :home
end


end
