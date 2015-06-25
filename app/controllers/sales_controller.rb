class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params.permit(:vendor_id)[:vendor_id])
    @sales = @vendor.sales

    if @sales.length == 0
      render ":empty"
    end
  end

  def current_month
    @vendor = Vendor.find(params.permit(:vendor_id)[:vendor_id])
    @sales = month_sales(@vendor)

    if @sales.length == 0
      render :empty
    else
      render :sales
    end
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    # class Person < ActiveRecord::Base
    #   validates :name, presence: true, length: { minimum: 3 }
    # end
    #
    # person = Person.new
    # person.valid? # => false
    # person.errors.messages
    #  # => {:name=>["can't be blank", "is too short (minimum is 3 characters)"]}
    #
    # person = Person.new(name: "John Doe")
    # person.valid? # => true
    # person.errors.messages # => {}
    #
    # class Person < ActiveRecord::Base
    #   validates :name, presence: true, length: { minimum: 3 }
    # end
    #
    # person = Person.new
    # person.valid? # => false
    # person.errors.messages
    #  # => {:name=>["can't be blank", "is too short (minimum is 3 characters)"]}
    #
    # person = Person.new(name: "John Doe")
    # person.valid? # => true
    # person.errors.messages # => {}

    params = create_params[:sale]
    params[:amount] = convert_dollars_to_cents(params[:amount])

    sale = Sale.new(params)

    if sale.valid?
      sale.save

      redirect_to "/vendors/#{ sale.vendor_id }/sales"
    else
      redirect_to "/vendors/#{ sale.vendor_id }/sales/new/error"
    end
  end

  def error
  end

  private

  def create_params
    params.permit(sale: [:amount, :purchase_time, :vendor_id,  :product_id])
  end

  def convert_dollars_to_cents(dollar_amount)
    cent_amount = dollar_amount.to_f * 100
    cent_amount = cent_amount.to_i

    return cent_amount == 0 ? "zero" : cent_amount
  end

  def month_sales(vendor)
    current_month = Time.now.month
    sales = []

    vendor.sales.each do |sale|
      sales.push(sale) if sale.purchase_time.month == current_month
    end

    return sales
  end
end
