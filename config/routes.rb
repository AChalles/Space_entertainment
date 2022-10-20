Rails.application.routes.draw do
  root to: 'about#index'
  get 'shows', to: "shows#index", as: "shows"
  get 'shows/:id', to: "shows#show", as: "show", constraints: {id: /\d+/}
  get 'users', to: "users#index", as: "users"
  get 'users/:id', to: "users#show", as: "user", constraints: {id: /\d+/}
  get 'episodes', to: "episodes#index", as: "episodes"
  get 'episodes/:id', to: "episodes#show", as: "episode", constraints: {id: /\d+/}
  get 'locations', to: "locations#index", as: "locations"
  get 'locations/:id', to: "locations#show", as: "location", constraints: {id: /\d+/}
  get 'characters', to: "characters#index", as: "characters"
  get 'characters/:id', to: "characters#show", as: "character", constraints: {id: /\d+/}
  get 'about', to: "about#index", as: "home"
  resources :characters, only: [:index, :show] do
    collection do
      get "search"
    end
  end
  # get 'home', to: "home#index", as: "home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
