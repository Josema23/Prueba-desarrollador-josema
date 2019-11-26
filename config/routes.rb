Rails.application.routes.draw do

  post "refresh", controller: :refresh, action: :create
  post "signin", controller: :signin, action: :create
  post "signup", controller: :signup, action: :create
  delete "signin", controller: :signin, action: :destroy

  get '/mensajes/:sala_id', to: 'mensajes#index'
  post 'mensajes', to: 'mensajes#create'

  resources :salas

  mount ActionCable.server => '/cable'

  root to: "home#index"

  # resources :mensajes

end
