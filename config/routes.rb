Rails.application.routes.draw do
  namespace :admin do
      resources :scheduled_dates
      resources :archives
      resources :djs

      root to: "scheduled_dates#index"
    end
    
    root to: 'home#index'
    resources :archives, only: %i[index]
    resources :contacts, only: %i[new create]
    resources :djs, only: [:show]
end
