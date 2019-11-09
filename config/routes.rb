Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# root 'orders#new'
  root 'statics#coming_soon'

  get 'coming_soon', to: 'statics#coming_soon'
	get 'ourstory', to: 'statics#ourstory'
	get 'thankyou', to: 'statics#thankyou'
	get 'feedback', to: 'statics#feedback'

	resources :products
	resources :users
	
	resources :orders do
		get 'assign', 'deliver', 'cancel'
	end

  get 'order', to: 'statics#order'

	get 'ongoing', to: 'orders#ongoing'

	get 'myorders', to: 'users#myorders'

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

end