Rails.application.routes.draw do
  resources :colectivos do
    member do
      post 'parada', to: 'colectivos#add_parada'
      delete 'parada', to: 'colectivos#delete_parada'
    end
  end
  resources :paradas

  put "/notificacion/:id", to: "colectivos#notificacion"
  get "/colectivos/favoritos", to: "colectivos#favoritos"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
