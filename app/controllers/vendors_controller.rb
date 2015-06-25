class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def login
    if (params.permit(:login_id)[:login_id].to_i <= Vendor.last.id)
      id = params.permit(:login_id)[:login_id]
      redirect_to "/vendors/#{ id }/dashboard"
    else
      redirect_to "/vendors/vendor_not_found"
    end
  end

  def dashboard
    @vendor = Vendor.find(params.permit(:id)[:id])
    all_sales = @vendor.sales
    @sales = all_sales.slice(0, 5)

    @total_amount = total_sales(@vendor)
    month_sales = month_sales(@vendor)
    @sum = 0
    month_sales.each { |sale| @sum += sale.amount }

    @all_products = @vendor.products
  end

  def new
    @vendor = Vendor.new
  end

  def create
    vendor = Vendor.new(create_params[:vendor])

    if vendor.valid?
      vendor.save

      redirect_to "/markets/#{ vendor.market_id }/dashboard"
    else
      redirect_to "/markets/#{ vendor.market_id }/vendors/new/error"
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    edited_vendor = create_params[:vendor]

    if Vendor.new(edited_vendor).valid?
      vendor.update(edited_vendor)

      # update when vendor#show is created
      redirect_to "/markets/#{ vendor.market_id }/dashboard"
    else
      redirect_to "/markets/#{ vendor.market_id }/vendors/new/error"
    end
  end

  def destroy
    vendor = Vendor.find(params[:id])
    vendor.destroy

    redirect_to "/markets/#{ params[:market_id] }/dashboard"
  end

  private

  def create_params
    params.permit(vendor: [:name, :number_of_employees, :market_id])
  end

  def total_sales(vendor)
    all_sales = vendor.sales
    amounts = all_sales.map { |sale| sale.amount }
    total = amounts.inject { |sum, n| sum + n }

    return total
  end

  def month_sales(vendor)
    current_month = Time.now.month
    sales = []

    vendor.sales.each do |sale|
      sales.push(sale) if sale.purchase_time.month == current_month
    end

    return sales
  end

  def error
  end
end # class
