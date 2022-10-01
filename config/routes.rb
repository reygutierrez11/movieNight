Rails.application.routes.draw do
  root 'pages#home'
  get "/nome", to: "pages#nome"
  get "/home", to: "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get "/suggestions", to: "suggestions#index"
  #get "/suggestions/:id", to: "suggestions#show"

  resources :posts, :suggestions ,:screenings, :home
end
