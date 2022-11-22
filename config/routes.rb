Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  
  resources :charities do
    resources :campaigns#, except: [:index]
  end

  resources :campaigns, only: [:index]

  get 'about', to: 'pages#about', as: 'about'
  get "help", to: "pages#help", as: 'help'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'

  get '/search' => 'search#index'
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :charities, only: [ :index, :show, :update, :create, :destroy ]
    end
  end

end
