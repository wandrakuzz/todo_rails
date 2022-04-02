Rails.application.routes.draw do
  resources :todo_lists do

  	resources :todo_items
  		patch "/revert/:id", to: "todo_items#revert", as: 'revert' 
  end
  get "/all_lists", to: "todo_lists#getAllEndpoint"
  root "todo_lists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
