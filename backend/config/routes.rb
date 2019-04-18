Rails.application.routes.draw do
  namespace :api do
    resources :users do

      resources :boards do
        resources :task_lists
      end
      
    end
    get '/boards', to: 'boards#all'
    get '/task_lists', to: 'task_lists#all'
  end

  root to: 'api/users#index'
  
  post '/graphql', to: 'graphql#query'
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post  '/auth/login',  to: 'authentication#login'
  get   '/auth/user',   to: 'authentication#show' 
  post  '/auth/logout', to: 'authentication#logout'
  get '/*a', to: 'application#not_found'
end