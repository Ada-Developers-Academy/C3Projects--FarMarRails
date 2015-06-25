class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all

    render :index
  end

  def create
    @vendors = Vendor.all
    @new = Vendor.new(create_params[:vendor])
    @new.save
    redirect_to market_path(id: params[:vendor][:market_id])
  end

  def new
    @new = Vendor.new
    @market = Market.find(params[:market_id])
  end

  def edit
    @edit = Vendor.find(params[:id])
    render :edit
  end

  def show

  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.name = create_params[:vendor][:name]
    @vendor.no_of_employees= create_params[:vendor][:no_of_employees]
    @vendor.save
    redirect_to "/vendors/#{params[:id]}"
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
      redirect_to "/markets/#{params[:market_id]}"
  end

  def create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
