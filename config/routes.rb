Rails.application.routes.draw do
  root to: 'financial_planner_posts#index'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  get 'customers/sign_up', to: 'customers#new'
  post 'customers/sign_up', to: 'customers#create'

  get 'financial_planners/sign_up', to: 'financial_planners#new'
  post 'financial_planners/sign_up', to: 'financial_planners#create'

  resources :financial_planners do
    resource :post, controller: 'financial_planner_posts', only: %i[new create show edit update destroy]
  end

  resources :appointments, only: %i[new create destroy]
end
