Rails.application.routes.draw do
  root 'pages#home'
  get "/nome", to: "pages#nome"
  get "/home", to: "pages#home"
  get "/fome", to: "pages#fome"
  get "/draw", to: "pages#draw"
  get "/sketch", to: "pages#sketch"
  devise_for :users


  resources :posts, :suggestions ,:screenings, :reviews
end
