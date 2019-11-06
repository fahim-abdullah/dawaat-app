Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'statics#order'
	get 'coming_soon', to: 'statics#coming_soon'

	resources :products

end
