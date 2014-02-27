Zillow::Application.routes.draw do

root 'homes#index'

  # Routes for the Home resource:
  # CREATE
  get '/homes/new', controller: 'homes', action: 'new', as: 'new_home'
  post '/homes', controller: 'homes', action: 'create', as: 'homes'

  # READ
  get '/homes', controller: 'homes', action: 'index'
  get '/homes/:id', controller: 'homes', action: 'show', as: 'home'

  # UPDATE
  get '/homes/:id/edit', controller: 'homes', action: 'edit', as: 'edit_home'
  patch '/homes/:id', controller: 'homes', action: 'update'

  # DELETE
  delete '/homes/:id', controller: 'homes', action: 'destroy'
  #------------------------------

  get("/address", { :controller => "zillow", :action => "fetch_zillow" })
  get("/zillow_stat", { :controller => "zillow", :action => "zillow_stat" })

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
