# config\routes.rb

MyBookshopTest2::Application.routes.draw do

  get "password_resets/new"

  resources :countries

	# list all available routes by running > rake routes
	# add a 'root :to' route then delete the file public/ index.html 
	root :to => 'products#index'
  
	match 'login', :to => 'sessions#new'					# login_path
	match 'sessions/create', :to => 'sessions#create'
	match 'logout', :to => 'sessions#destroy' 				# logout_path
		
	# a route to match the method search in the products controller
	match 'products/search' 								# products_search_path
	
	match 'products/display_products_by_city', :to => 'products#display_products_by_city'
  
	# a route to match the method multi_find in the products controller
	match 'products/multi_find' 		
	
	
	match 'review/new/:id',  :to => 'reviews#new'
	match 'review/displays/:id',  :to => 'reviews#displays'
	
	
	# move all resources to below here, so they are evaluated last !
	resources :products do
		resources :bookings
	end
	
	resources :users
	resources :countries
	resources :reviews
	resources :sessions
	resources :password_resets
	
	# route to catch all invalid routes
	match "*a", :to => "errors#routing"
	
end
