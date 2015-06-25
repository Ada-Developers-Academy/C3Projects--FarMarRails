class SalesController < ApplicationController

def index
  @header = "Your Sales"
  @vendor = Vendor.find(params[:id])
  @sales = Sale.where(:vendor_id => @vendor.id)
end

end
