Rails.application.routes.draw do
  devise_for :users
  resources :bookmarks
  resources :entries
  resources :users

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
