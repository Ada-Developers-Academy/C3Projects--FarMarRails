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

    redirect_to "/markets/#{ vendor.market_id }/dashboard"
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    edited_vendor = params[:vendor]

    vendor.update(
      name: edited_vendor[:name],
      number_of_employees: edited_vendor[:number_of_employees]
    )

    # update when vendor#show is created
    redirect_to "/markets/#{ vendor.market_id }/dashboard"
  end

  def delete
    vendor = Vendor.find(params[:id])
    vendor.delete

    redirect_to "/vendors"
  end

  def dashboard
    # I wasn't sure how else to handle this.
    if (params.permit(:query)[:query].to_i <= Vendor.last.id)
      @query = params.permit(:query)[:query]
    end

    vendor = Vendor.find(params[:query].to_i)
    all_sales = vendor.sales
    @sales = all_sales.slice(0, 5)
    @total_amount = total_sales(vendor)
    month_sales = month_sales(vendor)
    @sum = 0
    month_sales.each { |amount| @sum += amount }
  end

  def sales
    @vendor = Vendor.find(params.permit(:id)[:id])
    @sales = @vendor.sales
  end

  def sales_current_month
    @vendor = Vendor.find(params.permit(:id)[:id])
    @sales = month_sales(@vendor)

    if @sales.length == 0
      render :sales_empty
    else
      render :sales
    end
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

end # class
