Muser::Application.routes.draw do
  root :to => 'home#index'
  match '/auth/:provider/callback', to: 'sessions#create'
end
