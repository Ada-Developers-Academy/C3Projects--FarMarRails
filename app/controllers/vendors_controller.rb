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

  def search
    # I wasn't sure how else to handle this.
    if (params.permit(:q)[:q].to_i <= Vendor.last.id)
      @q = params.permit(:q)[:q]
    end
  end

  private

  def create_params
    params.permit(vendor: [:name, :number_of_employees])
  end

end # class
