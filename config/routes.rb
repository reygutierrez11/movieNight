Rails.application.routes.draw do
  root 'pages#home'
  get "/nome", to: "pages#nome"
  get "/home", to: "pages#home"
  get "/third", to: "pages#third"
  get "/draw", to: "pages#draw"
  get "/sketch", to: "pages#sketch"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get "/suggestions", to: "suggestions#index"
  #get "/suggestions/:id", to: "suggestions#show"

  resources :posts, :suggestions ,:screenings, :reviews
end
