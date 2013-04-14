Muser::Application.routes.draw do

  devise_for :users

  root :to => 'home#index'
  match '/auth/:provider/callback', to: 'sessions#create'

  resources :subscriptions
end
