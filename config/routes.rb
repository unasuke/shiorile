Rails.application.routes.draw do
  resources :bookmarks
  resources :entries
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  get '/auth/twitter/callback', to: 'sessions#create'
end
