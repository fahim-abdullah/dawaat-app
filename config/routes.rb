Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'orders#new'
	get 'coming_soon', to: 'statics#coming_soon'
	get 'ourstory', to: 'statics#ourstory'

	resources :products
	resources :users
	
	resources :orders do
		get 'assign', 'deliver'
	end

	get 'ongoing', to: 'orders#ongoing'

end