class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def current_month_sales
    # index
    @current_month = Sale.current_month.all
  end

end
