Rails.application.routes.draw do


  	resources :users
  	
	root "dashboard#index"
	
	# root to 'index.html'


  	controller :sessions do
	  get  'login' => :new
	  post 'login' => :create
  	  delete 'logout' => :destroy
 	end

	resources :therapists do
		resources :clients do
	  		resources :therapysessions
	  	end
	end

	resources :therapists do
	  	resources :therapysessions
	end

	resources :clients do
  		resources :therapysessions
  	end

    resources :address_books
	resources :therapysessions
	resources :clients
	resources :therapists

# could do this
	get "/bollocks" => "therapysessions#index"
  # get 'therapysessions/index'
  # get 'therapysessions/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end