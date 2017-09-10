Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'application#home'
  root to: 'users#index'
  get '/_health', to: 'application#health'
end
