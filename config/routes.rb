Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root "users#index"

  # routes to grab login pages
  get "/market_login" => "users#market_login"
  get "/vendor_login" => "users#vendor_login"

  # routes to dashboards (maybe keep as post only to simulate logged in environment. we can link_to with post methods.)
  post "/markets/login" => "markets#login"
  post "/vendors/login" => "vendors#loginb"
  get "/markets/:id/dashboard" => "markets#dashboard"
  get "/vendors/:id/dashboard" => "vendors#dashboard"
  get "/markets/market_not_found" => "markets#market_not_found"
  get "/vendors/vendor_not_found" => "vendors#vendor_not_found"

  # Jeri's routes to display sales lists
  get "/vendors/:id/sales" => "vendors#sales"
  get "/vendors/:id/sales/current" => "vendors#sales_current_month"

  resources :markets, except: [:destroy] do
    resources :vendors, except: [:index, :show]
  end

  resources :vendors do
    resources :products, except: [:show]
  end


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
