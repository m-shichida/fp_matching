Rails.application.routes.draw do
  root to: 'introduces#index'

  get 'sign_in', to: 'sessions#new'
  get 'customers/sign_up', to: 'customers#new'
  post 'customers/sign_up', to: 'customers#create'

  get 'financial_planners/sign_up', to: 'financial_planners#new'
  post 'financial_planners/sign_up', to: 'financial_planners#create'
end
