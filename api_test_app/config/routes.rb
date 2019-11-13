Rails.application.routes.draw do
	post 'authenticate', to: 'authentication#authenticate'

  resources :users
  resources :tags do
  	patch 'add_user' => :add_user
  	patch 'remove_user' => :remove_user
  end
end
