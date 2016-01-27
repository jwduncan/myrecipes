Rails.application.routes.draw do

  root 'pages#home'
  get '/home', to: 'pages#home'

  # Recipes
  resources :recipes do
    member do 
      post 'like'
    end
   resources :reviews, only: [:create, :destroy]
  end
  
  # Chefs
  resources :chefs, except: [:new, :destroy]
  get '/register', to: 'chefs#new'
  
  #Login and Logout
  get  '/login',  to: 'logins#new'
  post '/login',  to: 'logins#create'
  get  '/logout', to: 'logins#destroy'

  #styles
  resources :styles, only: [:new, :create, :show]
  
  #ingredients
  resources :ingredients, only: [:new, :create, :show]
  
  
end
