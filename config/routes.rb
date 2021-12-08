Rails.application.routes.draw do
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :customers do
    resources :accounts, only: [:new, :create, :show, :index]
  end

  namespace :api do
    namespace :v1 do
      post 'accounts/new_transaction', to: 'accounts#new_transaction'
    end
  end
end
