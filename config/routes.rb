Rails.application.routes.draw do
  root 'users#index'

  resources :markets, except: [:destroy] do
    resources :vendors, except: [:index] do
      resources :sales, only: [:create, :new]
      resources :products, except: [:show]
    end
  end

  get  "/all_markets"        => "users#show"
  get  "/all_markets/:id"    => "users#market_details"

  # Market index page sorts
  get "/markets_/name_sort"      => "markets#name_sort"
  get "/markets_/city_sort"      => "markets#city_sort"
  get "/markets_/state_sort"     => "markets#state_sort"
  get "/all_markets_/name_sort"  => "users#name_sort"
  get "/all_markets_/city_sort"  => "users#city_sort"
  get "/all_markets_/state_sort" => "users#state_sort"

  # Market index page search
  get "/markets_/search_results" => "markets#search"
  
  # Vendor Portal
  get  "/vendor_portal"      => "vendors#landing"
  post "/vendor_portal"      => "vendors#login"
  get  "/vendor_portal/:id"  => "vendors#portal", as: :vendor_portal_page

end
