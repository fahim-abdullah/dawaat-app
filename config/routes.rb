Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'orders#new'
  # root 'statics#coming_soon'

  resources :delivery_points
  resources :promo_codes

  get 'coming_soon', to: 'statics#coming_soon'
	get 'ourstory', to: 'statics#ourstory'
	get 'thankyou', to: 'statics#thankyou', as: :thankyou
	get 'contactus', to: 'statics#contactus'

	resources :products
	resources :users
	resources :expenses
	
	resources :orders do
		get 'assign', 'deliver', 'cancel'
	end

  get 'order', to: 'statics#order'

	get 'ongoing', to: 'orders#ongoing', as: :ongoing

	get 'myorders', to: 'users#myorders', as: :myorders

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

  post 'promo_codes/apply', to: 'promo_codes#apply', as: :promo_codes_apply

end