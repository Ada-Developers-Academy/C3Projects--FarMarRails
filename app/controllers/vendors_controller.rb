class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    vendor = Vendor.new(create_params[:vendor])
    vendor.save
    redirect_to "/vendors"
  end

  def edit
    @vendor = Vendor.find(params[:vendor_id])
  end

  def update
    vendor = Vendor.find(params[:vendor_id])
    edited_vendor = params[:vendor]

    vendor.update(
      name: edited_vendor[:name],
      number_of_employees: edited_vendor[:number_of_employees]
    )

    # update when vendor#show is created
    redirect_to "/vendors/"
  end

  def delete
    vendor = Vendor.find(params[:vendor_id])
    vendor.delete

    redirect_to "/vendors"
  end

  def dashboard
    # I wasn't sure how else to handle this.
    if (params.permit(:query)[:query].to_i <= Vendor.last.id)
      @query = params.permit(:query)[:query]
    end

    vendor = Vendor.find(params[:q].to_i)
    sales = Sale.all
    all_sales = vendor.sales
    @sales = all_sales.slice(0, 5)
    total_sales = total_sales(vendor)
  end

  def sales
    @vendor = Vendor.find(params.permit(:id)[:id])
    @sales = @vendor.sales
  end

  def sales_current_month
    current_month = Time.now.month

    @vendor = Vendor.find(params.permit(:id)[:id])
    @sales = []

    sales = @vendor.sales.map do |sale|
      @sales.push(sale) if sale.purchase_time.month == current_month
    end

    if @sales.length == 0
      render :sales_empty
    else
      render :sales
    end
  end

  private

  def create_params
    params.permit(vendor: [:name, :number_of_employees])
  end

  def total_sales(vendor)
    all_sales = vendor.sales

  end

end # class
