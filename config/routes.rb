Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#home"

  namespace :api do
    namespace :v1 do
      resources :users
      resources :categories
      resources :transactions
      resources :budgets
      resources :bills

      get "/user_transactions", to: "users#transactions"
    end
  end
end
