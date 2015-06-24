Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#welcome'

  resources :users, only: [:index] do
    collection do
      get 'markets', action: 'index', as: 'markets'
      get 'markets/:id', action: 'show', as: 'market'
      get 'markets/:id/vendors', action: 'vendors', as: 'vendors'
    end
  end

  resources :markets, only: [:index, :show] do

  end

  resources :vendors, only: [:index, :show] do
    member do
      get 'sales', action: 'sales', as: 'sales'
      get 'products', action: 'products', as: 'products'
      get 'products/:id', action: 'show_product', as: 'product'
    end

  end


    # EXAMPLE
    # collection do
    #   get 'released/:year', action: 'by_year',  as: 'by_year'
    # end
    # by_year_albums GET  /albums/released/:year(.:format) albums#by_year
    # <%= link_to "Albums for the year #{@year}", by_year_albums_path(@year) %>



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
