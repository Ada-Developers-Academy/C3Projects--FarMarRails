Rails.application.routes.draw do
  # root.
  root "users#index"

  # grab login pages.
  get "/market" => "users#market"
  get "/vendor" => "users#vendor"

  # attempting to log in.
  post "/markets/login" => "markets#login"
  post "/vendors/login" => "vendors#login"

  # unsuccessful login redirects here.
  get "/markets/market_not_found" => "markets#market_not_found"
  get "/vendors/vendor_not_found" => "vendors#vendor_not_found"

  # successful login redirects to these dashboards.
  get "/markets/:id/dashboard" => "markets#dashboard"
  get "/vendors/:id/dashboard" => "vendors#dashboard"

  # resource routes for market users.
  resources :markets, except: [:destroy] do
    resources :vendors, except: [:index, :show]
  end

  # market user error messages. some of these might only be hit by scripting
  # attacks that don't use the form or by users with older browsers that don't
  # recognize the required attribute in form fields.
  get "/markets/new/error" => "markets#error"
  get "/markets/edit/error" => "markets#error"
  get "/markets/:market_id/vendors/new/error" => "vendors#error"
  get "/markets/:market_id/vendors/edit/error" => "vendors#error"

  # resource routes for vendor users.
  resources :vendors, only: [] do
    resources :products, except: [:show]
    resources :sales, only: [:index, :new, :create]
  end

  # vendor user error messages. some of these might only be hit by scripting
  # attacks that don't use the form or by users with older browsers that don't
  # recognize the required attribute in form fields.
  get "/vendors/:vendor_id/sales/current" => "sales#current_month"
  get "/vendors/:vendor_id/products/new/error" => "products#error"
  get "/vendors/:vendor_id/products/edit/error" => "products#error"
  get "/vendors/:vendor_id/sales/new/error" => "sales#error"
end
