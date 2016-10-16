Rails.application.routes.draw do
  root to: 'static_page#home'
  get 'signup', to: 'users#new'
  
  resources :users
end
