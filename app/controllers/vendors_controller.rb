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
    @sales = @vendor.recent_sales_first(5)

    @total_amount = @vendor.total_sales
    @sum = @vendor.month_total_sales

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

  def error
  end

  private

  def create_params
    params.permit(vendor: [:name, :number_of_employees, :market_id])
  end
end # class
