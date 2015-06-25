Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "users#index"

  # routes to grab login pages
  get "/market" => "users#market"
  get "/vendor" => "users#vendor"

  # routes to dashboards (maybe keep as post only to simulate logged in environment. we can link_to with post methods.)
  post "/markets/login" => "markets#login"
  post "/vendors/login" => "vendors#login"
  get "/markets/:id/dashboard" => "markets#dashboard"
  get "/vendors/:id/dashboard" => "vendors#dashboard"
  get "/markets/market_not_found" => "markets#market_not_found"
  get "/vendors/vendor_not_found" => "vendors#vendor_not_found"

  # resource routes for market users
  resources :markets, except: [:destroy] do
    resources :vendors, except: [:index, :show]
  end

  # custom routes for market users
  get "/markets/new/error" => "markets#error"
  get "/markets/edit/error" => "markets#error"
  get "/markets/:market_id/vendors/new/error" => "vendors#error"
  get "/markets/:market_id/vendors/edit/error" => "vendors#error"

  # routes for vendor users
  resources :vendors, only: [] do
    resources :products, except: [:show]
    resources :sales, only: [:index, :new, :create]
  end

  # custom routes for vendor user error messages)
  get "/vendors/:vendor_id/sales/current" => "sales#current_month"
  get "/vendors/:vendor_id/products/new/error" => "products#error"
  get "/vendors/:vendor_id/products/edit/error" => "products#error"
  get "/vendors/:vendor_id/sales/new/error" => "sales#error"
end
