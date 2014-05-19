Rails.application.routes.draw do
  get '/todos/deleteactivity' , controller: 'todos' , actions: 'deleteactivity'
  get '/todos/listactivities' , controller: 'todos' , actions: 'listactivities'
  post '/todos/createactivity' , controller: 'todos' , actions: 'createactivity'
  get '/todos/home' , controller: 'todos' , actions: 'home'
get '/todos/populate' , controller: 'todos' , actions: 'populate'
  get '/users/populate' , controller: 'users' , actions: 'populate'
post '/todos/verify' , controller: 'todos' , actions: 'todos'
post '/todos/insertintodb' , controller: 'todos' , actions: 'insertintodb'
get '/todos/insert' , controller: 'todos' , actions: 'insert'

get '/users/logout' , controller: 'users' , actions: 'logout'
get '/users/admin' , controller: 'users' , actions: 'admin'
get '/users/login' , controller: 'users', action: 'login'
  post '/users/verify' , controller: 'users', action: 'verify'
  resources :users 

  

  


  #resources :todos

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  resources :todos 
   root 'todos#home'

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
