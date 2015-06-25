class SalesController < ApplicationController

  def new
    @sale = Sale.new

    @vendor = Vendor.find(params[:vendor_id])

    @products = @vendor.products
  end

  def create
    p = create_params[:sale]

    p[:amount] = p[:amount].to_f * 100

    @sale = Sale.create(p)

    redirect_to vendor_path(params[:sale][:vendor_id])
  end


  def month_sales
    @time = Time.now

    @vendor = Vendor.find(params[:vendor_id])

    sales = @vendor.sales

    @month_sales = sales.where(:purchase_time => @time.beginning_of_month..@time.end_of_month)

    @month_revenue = month_revenue

    render :month_sales
  end

  def month_revenue
    amounts = @month_sales.collect do |sale|
      sale.amount
    end

    amounts.inject do |sum, n|
      sum + n
    end
  end


  def destroy
    @sale = Sale.destroy(params[:id])

    redirect_to vendor_path(@sale.vendor_id)
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id, :id])
  end

end
