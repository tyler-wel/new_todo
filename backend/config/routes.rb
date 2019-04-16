Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :boards
    end
  end
  root to: 'api/v1/boards#index'
end
