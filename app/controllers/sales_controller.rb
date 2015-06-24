class SalesController < ApplicationController

  def permit_params
    params.permit(sale:[:amount,:purchase_time,:vendor_id,:product_id])
  end
end
