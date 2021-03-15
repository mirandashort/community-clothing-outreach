Rails.application.routes.draw do
  get 'appointment/index'
  devise_for :users
  devise_scope :user do
    get '/logout' => 'devise/sessions#destroy'
  end
  root to: 'pages#index'

  get '/', to: 'pages#index'

  resources :users do
    resources :appointments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
