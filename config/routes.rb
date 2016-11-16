Rails.application.routes.draw do


  # standard routes
  get '/' => 'jobs#index'
  get '/jobs' => 'jobs#index'

  get '/jobs/new' => 'jobs#new'
  post '/jobs' => 'jobs#create'

  get 'jobs/:id' => 'jobs#show'

  get 'jobs/:id/edit' => 'jobs#edit'
  patch 'jobs/:id' => 'jobs#update'

  delete 'jobs/:id' => 'jobs#destroy'

  # user routes

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  # session routes

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  # orders routes

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

  # carted products
  post '/carted_products' => 'carted_products#create'

  get '/carted_products' => 'carted_products#index'

  get '/carted_products/distance' => 'carted_products#distance'

  get '/carted_products/priority' => 'carted_products#priority'

  patch '/carted_products/update_row_order' => 'carted_products#update_row_order'

  get '/carted_products/reorder' => 'carted_products#reorder'

  get '/carted_products/:id' => 'carted_products#show'

  get '/carted_products/:id/edit' => 'carted_products#edit'
  patch '/carted_products/:id' => 'carted_products#update'
  
  delete '/carted_products/:id' => 'carted_products#destroy'

  # places routes

    resources :places, except: [:update, :edit, :destroy]
  root 'places#index'


end
