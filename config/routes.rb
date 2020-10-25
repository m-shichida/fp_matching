Rails.application.routes.draw do
  root to: 'introduces#index'

  get 'sign_in', to: 'sessions#new'
  get 'customers/sign_up', to: 'customers#new'
end
