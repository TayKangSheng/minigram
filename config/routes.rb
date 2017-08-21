Rails.application.routes.draw do
  root to: 'grams#index'

  get 'grams/custom' => 'grams#custom', as: 'hihi'
  resources :grams
  resources :users

  get 'sign_in'       => 'sessions#new'
  post 'sign_in'      => 'sessions#create'
  delete 'sign_out'   => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
