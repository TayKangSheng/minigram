Rails.application.routes.draw do
  get 'grams/custom' => 'grams#custom', as: 'hihi'
  resources :grams
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
