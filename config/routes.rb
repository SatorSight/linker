Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'login#index'

	get '/links', to: 'main#index'

	post '/login', to: 'login#login'

	resources :links

end
