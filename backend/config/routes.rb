Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, param: :id do
        resources :boards
      end
    end
  end
  root to: 'api/v1/boards#index'
  post '/graphql', to: 'graphql#query'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post  '/auth/login',  to: 'authentication#login'
  get   '/auth/user',   to: 'authentication#show' 
  post  '/auth/logout', to: 'authentication#logout'
  get '/*a', to: 'application#not_found'
end
