class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    render 'vendor/index'
  end
end
