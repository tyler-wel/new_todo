Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  namespace :api do
    resources :users
    resources :boards
  end
  root to: 'api/boards#index'
  post '/graphql', to: 'graphql#query'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post  '/auth/login',  to: 'authentication#login'
  get   '/auth/user',   to: 'authentication#show' 
  post  '/auth/logout', to: 'authentication#logout'
  get '/*a', to: 'application#not_found'
end
