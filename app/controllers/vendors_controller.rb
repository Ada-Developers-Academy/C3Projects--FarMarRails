class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def login
    id = params[:login_id].to_i

    if (id <= Vendor.last.id && id > 0)
      redirect_to "/vendors/#{ id }/dashboard"
    else
      redirect_to "/vendors/vendor_not_found"
    end
  end

  def dashboard
    @vendor = Vendor.find(params[:id])
    @recent_sales = @vendor.recent_sales_first(5)

    @total_amount = Money.us_dollar(@vendor.total_sales).format
    @total_month_amount = Money.us_dollar(@vendor.month_total_sales).format

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

  def error; end

  private

  def create_params
    params.permit(vendor: [:name, :number_of_employees, :market_id])
  end
end # class
