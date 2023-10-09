Rails.application.routes.draw do
  resources :movies
  root 'pages#home'
  get "/nome", to: "pages#nome"
  get "/home", to: "pages#home"
  get "/fome", to: "pages#fome"
  get "/draw", to: "pages#draw"
  get "/sketch", to: "pages#sketch"
  get "/complete", to: "pages#complete"
  get "/vaulted", to: "pages#vaulted"
  devise_for :users
 
  resources :suggestions do
    member do
      post "like" => "suggestions#like"
    end
  end

  resources :suggestions do
    collection do
      post 'clear'
    end
  end


  resources :posts, :screenings, :reviews
end
