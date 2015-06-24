class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params.permit(:id)[:id])
    @sales = @vendor.sales
  end

  def current_month
    @vendor = Vendor.find(params.permit(:id)[:id])
    @sales = month_sales(@vendor)

    if @sales.length == 0
      render :empty
    else
      render :sales
    end
  end

  private

  def month_sales(vendor)
    current_month = Time.now.month
    sales = []

    vendor.sales.each do |sale|
      sales.push(sale) if sale.purchase_time.month == current_month
    end

    return sales
  end
end
