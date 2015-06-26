Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

  resources :markets do
    resources :vendors do
      resources :sales
      resources :products
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

  # Vendor Portal
  get  "/vendor_portal"      => "vendors#landing"
  post "/vendor_portal"      => "vendors#login"
  get  "/vendor_portal/:id"  => "vendors#portal", as: :vendor_portal_page

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
