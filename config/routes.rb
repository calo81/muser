Muser::Application.routes.draw do




  devise_for :users

  root :to => 'home#index'
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/subscriptions/upload', :to => 'subscriptions#upload'
  match '/subscriptions/search', :to => 'subscriptions#search'

  resources :subscriptions
  resources :entries
end
