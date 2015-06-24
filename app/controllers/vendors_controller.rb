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

  private

  def create_params
    params.permit(vendor: [:name, :number_of_employees])
  end
end
